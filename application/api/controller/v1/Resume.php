<?php
namespace app\api\controller\v1;

use app\api\model\Applicants;
use think\Request;
use think\response\Json;
use app\api\model\InterviewArrangement;

class Resume {
    /**
     * 获取详细资料
     * @author SongYong
     * @groupRequired
     * @permission('获取简历信息','简历')
     * @param $id
     * @param('id','应聘者ID','require|number')
     * @return Json
     */
    public function getInfo ($id) {
        $res = Applicants::get($id);
        $res->InterviewArrangement;
//        $res = Applicants::with(['InterviewArrangement', 'InterviewArrangement.Evaluates'])->get($id);
        if ($res) {
            return writeJson(200, $res, '');
        }
    }

    /**
     * 编辑信息
     * @author SongYong
     * @groupRequired
     * @permission('编辑简历','简历')
     * @param $id
     * @param('id','应聘者ID','require|number')
     * @return Json
     */
    public function editInfo (Request $request) {
        $params = $request->post();
        $res = Applicants::update($params);
        if ($res) {
            return writeJson(200, '', '修改成功');
        }
    }

    /**
     * 获取全部简历接口（Tab）
     * @author SongYong
     * @groupRequired
     * @permission('获取简历信息','简历')
     * @return Json
     */
    public function getAllInfo (Request $request) {
        $params = $request->get();
        $data['waiting_check'] = Applicants::where('status', 0)->select();
        if ($params['interview_name'] === '张慧灵') {
//            $data['waiting_check'] = Applicants::where('status', 0)->select();
            $data['waiting_interview'] = Applicants::where('status', 1)->select();
//            $data['interviewed'] = Applicants::where('status', 2)->select();
        } else {
//            $applicants_id = InterviewArrangement::where('interview_name', $params['interview_name'])->field('applicants_id')->select();
//            $data['waiting_interview'] = Applicants::where('status', 1)->where('interview_name', $params['interview_name'])->select();
            $applicants_ids = [];
            $applicants_id = InterviewArrangement::where('interview_name', $params['interview_name'])->field('applicants_id')->select();
            foreach ($applicants_id as $key => $value) {
                array_push($applicants_ids, $value['applicants_id']);
            }
            $data['waiting_interview'] = Applicants::where('status', 1)->select($applicants_ids);
        }
        $data['interviewed'] = Applicants::where('status', 2)->select();
        if ($data) {
            return writeJson(200, $data, '');
        }
    }
}