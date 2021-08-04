<?php
namespace app\api\service;

use app\api\model\Applicants;
use app\api\model\Departments;
use app\api\model\InterviewArrangement as InterviewArrangementModel;
use app\api\model\Positions;
use app\lib\exception\OperationException;
use think\Db;
use think\Exception;

class InterviewProcess {
    const KunZong = [
        'id' => 2,
        'username' => '杨昆昆'
    ];
    const LiuZong = [
        'id' => 3,
        'username' => '刘欣竹'
    ];
    public static function isTrainee ($params) {
        $res = InterviewArrangementModel::where('applicants_id', $params['id'])->select();
        if (sizeof($res) == 0) {
            Db::startTrans();
            try {
                InterviewArrangementModel::create([
                    'applicants_id' => $params['id'],
                    'lin_user_id' => $params['lin_user_id'],
                    'interview_name' => $params['interview_name'],
                    'appointment_time' => $params['appointment_time']
                ]);
                Applicants::where('id', $params['id'])->update([
                    'status' => 1,
//                    'interview_name' => $params['interview_name']
                ]);
                Db::commit();
            } catch (Exception $e) {
                Db::rollback();
                throw new OperationException(['msg' => '预约失败']);
            }
            return true;
        }

        $resumeInfo = Applicants::where('id', $params['id'])->find();
        $interviewer_position_info = Positions::where('name', $resumeInfo['application_position'])->find();
        if ($interviewer_position_info['interviewer_name']) {
            switch (sizeof($res)) {
                case 1:
                    $result = self::groupLeaderInterview($params, $interviewer_position_info);
                    break;
                case 2:
                    $result = self::ministerInterview($params, $resumeInfo);
                    break;
                case 3:
                    $result = self::finalInterview($params, $resumeInfo);
                    break;
                default:
//                    $result = self::Adjustment($params);
                    $result = self::Adjustment($params, $resumeInfo);
                    break;
            }
        } else {
            switch (sizeof($res)) {
                case 1:
                    $result = self::ministerInterview($params, $resumeInfo);
                    break;
                case 2:
                    $result = self::finalInterview($params, $resumeInfo);
                    break;
                default:
//                    $result = self::Adjustment($params);
                    $result = self::Adjustment($params, $resumeInfo);
                    break;
            }
        }
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    //组长面试
    public static function groupLeaderInterview ($params, $interviewer_position_info) {
        Db::startTrans();
        try {
            InterviewArrangementModel::create([
                'applicants_id' => $params['id'],
                'lin_user_id' => $interviewer_position_info['lin_user_id'],
                'interview_name' => $interviewer_position_info['interviewer_name'],
                'appointment_time' => $params['appointment_time']
            ]);
            Applicants::where('id', $params['id'])->update([
                'status' => 1,
//                'interview_name' => $params['interview_name']
            ]);
            Db::commit();
        } catch (Exception $e) {
            Db::rollback();
            throw new OperationException(['msg' => '预约失败']);
        }
        return true;
    }

    //部长面试
    public static function ministerInterview ($params, $resumeInfo) {
        Db::startTrans();
        try {
            $data = Departments::where('name', $resumeInfo['application_department'])->find();
            InterviewArrangementModel::create([
                'applicants_id' => $params['id'],
                'lin_user_id' => $data['lin_user_id'],
                'interview_name' => $data['interviewer_name'],
                'appointment_time' => $params['appointment_time']
            ]);
            Applicants::where('id', $params['id'])->update([
                'status' => 1,
//                'interview_name' => $params['interview_name']
            ]);
            Db::commit();
        } catch (Exception $e) {
            Db::rollback();
            throw new OperationException(['msg' => '预约失败']);
        }
        return true;
    }

    //终面
    public static function finalInterview ($params, $resumeInfo) {
        $trainee = $resumeInfo['trainee'];
        if ($trainee == 1) {
            Db::startTrans();
            try {
                InterviewArrangementModel::create([
                    'applicants_id' => $params['id'],
                    'lin_user_id' => self::KunZong['id'],
                    'interview_name' => self::KunZong['username'],
                    'appointment_time' => $params['appointment_time']
                ]);
                Applicants::where('id', $params['id'])->update([
                    'status' => 1,
//                    'interview_name' => $params['interview_name']
                ]);
                Db::commit();
            } catch (Exception $e) {
                Db::rollback();
                throw new OperationException(['msg' => '预约失败']);
            }
            return true;
        }
        if ($trainee == 2) {
            Db::startTrans();
            try {
                InterviewArrangementModel::create([
                    'applicants_id' => $params['id'],
                    'lin_user_id' => self::LiuZong['id'],
                    'interview_name' => self::LiuZong['username'],
                    'appointment_time' => $params['appointment_time']
                ]);
                Applicants::where('id', $params['id'])->update([
                    'status' => 1,
//                    'interview_name' => $params['interview_name']
                ]);
                Db::commit();
            } catch (Exception $e) {
                Db::rollback();
                throw new OperationException(['msg' => '预约失败']);
            }
            return true;
        }
    }

    //岗位调剂
//    public static function Adjustment ($params) {
//        $data = Departments::where('name', $params['recommend_department'])->find();
//        $res = InterviewArrangementModel::create([
//            'applicants_id' => $params['id'],
//            'lin_user_id' => $data['lin_user_id'],
//            'interview_name' => $data['interviewer_name'],
//            'appointment_time' => $params['appointment_time']
//        ]);
//        if ($res) {
//            return true;
//        }
//    }
    public static function Adjustment ($params, $resumeInfo) {
        Db::startTrans();
        try {
            $data = Departments::where('name', $resumeInfo['recommend_department'])->find();
            InterviewArrangementModel::create([
                'applicants_id' => $params['id'],
                'lin_user_id' => $data['lin_user_id'],
                'interview_name' => $data['interviewer_name'],
                'appointment_time' => $params['appointment_time']
            ]);
            Applicants::where('id', $params['id'])->update([
                'status' => 1,
//                'interview_name' => $params['interview_name']
            ]);
            Db::commit();
        } catch (Exception $e) {
            Db::rollback();
            throw new OperationException(['msg' => '预约失败']);
        }
        return true;
    }
}