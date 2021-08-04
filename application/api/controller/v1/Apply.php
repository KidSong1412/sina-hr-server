<?php
namespace app\api\controller\v1;

use app\api\model\Applicants;
use app\api\model\Departments;
use app\api\model\Positions;
use app\lib\exception\OperationException;
use think\Request;
use think\response\Json;

class Apply {
    /**
     * 创建申请者信息
     * @author SongYong
     * @validate('Apply')
     * @throws OperationException
     * @return Json
     */
    public function create (Request $request) {
        $params = $request->post();
        $params['create_time'] = time();
        $res = Applicants::create($params);
        if ($res) {
            return writeJson(201, '', '简历创建成功');
        }
    }

    /**
     * 获取正式员工岗位接口
     * @author SongYong
     * @return Json
     */
    public function getRegularPost () {
        $data['department'] = Departments::field('id, name')->select();
        $data['post'] = Positions::where('internship', 1)->select();
        if ($data) {
            return writeJson(200, $data, '');
        }
    }

    /**
     * 获取实习员工岗位接口
     * @author SongYong
     * @return Json
     */
    public function getInternshipPost () {
        $data['department'] = Departments::field('id, name')->select();
        $data['post'] = Positions::where('internship', 2)->select();
        if ($data) {
            return writeJson(200, $data, '');
        }
    }
}