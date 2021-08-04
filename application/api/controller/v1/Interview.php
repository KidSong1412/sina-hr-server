<?php
namespace app\api\controller\v1;

use app\api\model\Applicants;
use app\api\model\InterviewArrangement;
use app\api\model\InterviewArrangement as InterviewArrangementModel;
use app\api\service\InterviewProcess;
use think\Request;
use think\response\Json;

class Interview {
    /**
     *  预约面试时间
     * @author SongYong
     * @groupRequired
     * @permission('预约面试','面试')
     * @param Request $request
     * @param('id','应聘者ID','require|number')
     * @param('appointment_time','预约时间','integer')
     * @return Json
     */
    public function toOrder (Request $request) {
        $params = $request->post();
        $params['applicants_id'] = $params['id'];
        $trainee = Applicants::where('id', $params['id'])->value('trainee');
        $res = InterviewProcess::isTrainee($params);
        if ($res) {
            return writeJson(200, '', '预约成功');
        }
    }

    /**
     * 实际抵达时间
     * @author SongYong
     * @groupRequired
     * @permission('签到','面试')
     * @param Request $request
     * @param('id','应聘者ID','require|number')
     * @param('appointment_time','预约时间','integer')
     * @return Json
     */
    public function arrive (Request $request) {
        $params = $request->post();
        $id = InterviewArrangementModel::where('applicants_id', $params['id'])->max('id');
        $res = InterviewArrangementModel::where('id', $id)->update([
            'actual_time' => $params['actual_time']
        ]);
        if ($res) {
            return writeJson(200, '', '编辑成功');
        }
    }

    /**
     * 获取面试进度接口
     * @author SongYong
     * @groupRequired
     * @permission('面试进度','面试')
     * @param('id','应聘者ID','require|number')
     * @return Json
     */
    public function getInterviewDetail ($id) {
        $progress = InterviewArrangement::where('applicants_id', $id)->select();
        if ($progress) {
            return writeJson(200, $progress, '');
        }
    }
}