<?php
namespace app\api\controller\v1;

use app\api\model\Applicants;
use app\api\model\Evaluates;
use app\api\model\InterviewArrangement;
use app\lib\exception\OperationException;
use function PHPSTORM_META\type;
use think\Db;
use think\Exception;
use think\Request;
use think\response\Json;
use app\api\controller\v1\Interview as InterviewController;

class CommentResult {
    /**
     * 面试官评析
     * @author SongYong
     * @groupRequired
     * @permission('评析','评析')
     * @param Request $request
     * @param('id','应聘者ID','require|number')
     * @param('uid','面试官ID','require|number')
     * @param('result','考察结果','require|number')
     * @return Json
     */
    public function evaluates (Request $request) {
        $params = $request->post();
        Db::startTrans();
        try {
            Evaluates::create([
                'applicants_id' => $params['id'],
                'lin_user_id' => $params['uid'],
                'name' => $params['username'],
                'work_experience' => $params['work_experience'],
                'communication' => $params['communication'],
                'analyze_and_slove' => $params['analyze_and_slove'],
                'profession' => $params['profession'],
                'team_spirit' => $params['team_spirit'],
                'quality' => $params['quality'],
                'matching' => $params['matching'],
                'advantage' => $params['advantage'],
                'shortcoming' => $params['shortcoming'],
                'result' => $params['result'],
                'create_time' => time()
            ]);
            InterviewArrangement::where([
                'applicants_id' => $params['id'],
                'lin_user_id' => $params['uid']
            ])->update([
                'result' => $params['result']
            ]);
            Applicants::where('id', $params['id'])->update([
                'status' => 2
            ]);
            Db::commit();
        } catch (Exception $e) {
            Db::rollback();
            throw new OperationException(['msg' => '提交失败']);
        }
        return writeJson(201, '', '提交成功');
    }

    /**
     * 获取面试评析接口
     * @author SongYong
     * @groupRequired
     * @permission('查看评析','评析')
     * @param('id','应聘者ID','require|number')
     * @return Json
     */
    public function getEvaluates ($id) {
        $evaluates = Evaluates::where('applicants_id', $id)->select()->toArray();
        $interview = InterviewArrangement::where('applicants_id', $id)->select();
        for ($i = 0; $i < sizeof($evaluates); $i++) {
            if ($evaluates[$i]['lin_user_id'] == $interview[$i]['lin_user_id'] && $interview[$i]['applicants_id'] == $id) {
                $evaluates[$i]['appointment_time'] = $interview[$i]['appointment_time'];
                $evaluates[$i]['actual_time'] = $interview[$i]['actual_time'];
            }
        }
        if ($evaluates) {
            return writeJson(200, $evaluates, '');
        }
    }
}