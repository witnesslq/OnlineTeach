package com.teachMng.onlineTeach.autoplan;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.teachMng.onlineTeach.dto.ClassCoursePara;
import com.teachMng.onlineTeach.model.ClassRoom;
import com.teachMng.onlineTeach.model.Course;
import com.teachMng.onlineTeach.model.CoursePlanItem;
import com.teachMng.onlineTeach.model.Major;
import com.teachMng.onlineTeach.model.MajorsCourse;
import com.teachMng.onlineTeach.model.SchoolClass;
import com.teachMng.onlineTeach.model.Student;
import com.teachMng.onlineTeach.model.Teacher;
import com.teachMng.onlineTeach.service.IClassRoomService;
import com.teachMng.onlineTeach.service.ICoursePlanItemService;
import com.teachMng.onlineTeach.service.ICourseService;
import com.teachMng.onlineTeach.service.IMajorService;
import com.teachMng.onlineTeach.service.IMajorsCourseService;
import com.teachMng.onlineTeach.service.ISchoolClassService;
import com.teachMng.onlineTeach.service.IStudentService;
import com.teachMng.onlineTeach.service.ITeacherService;

@Component("autoPlan")
public class AutoPlan {

	/*
	 * 排列课程表 此方法不会将数据插入数据库 。return:排列好的所有课程表
	 */
	public List<CoursePlanItem> beginPlan() {
		arrange();
		System.out.println("-----------end!");
		return coursePlan;
	}

	/*
	 * 把课程表插入到数据库中。
	 * return：true-插入成功。false-插入失败
	 */
	public boolean insToDB() {
		if(null == coursePlan || 0 >= coursePlan.size()) {
System.out.println("你神经病啊！什么数据都没有，我存什么进去。fuck");
			return false;
		}
		boolean flag = false;
		Iterator<CoursePlanItem> _cpiIter = coursePlan.iterator();
		CoursePlanItem _cpi;
		int _count = 0;
		while (_cpiIter.hasNext()) {
			_cpi = _cpiIter.next(); //
			//			System.out.println(cpi.getSchoolClass().getMajor() + ""
//					+ cpi.getSchoolClass() + "  " + // cpi.getCourse() + "  " +
//					cpi.getClassRoom() + "  " + // cpi.getTeacher() + "  " +
//					cpi.getCpParagraph());
//			System.out.println(cpi.getSchoolClass().getMajor().getMajorName()
//					+ cpi.getSchoolClass().getScName() + "  "
//					+ cpi.getCourse().getCourseName() + "  "
//					+ cpi.getClassRoom().getCrName() + "  "
//					+ cpi.getTeacher().getTeacName() + "           "
//					+ cpi.getCpParagraph());
			try{
				coursePlanItemService.insCoursePlanItem(_cpi);
			} catch(Exception e) {       //插入时出错
				deleteAll();     
				System.out.println("插入课程表到数据库时出错!插入失败。");
				e.printStackTrace();
				return false;
			}
			 _count++; 
		}
		System.out.println("总共有" + _count + "条");
		return flag;
	}

	/*
	 * 开始。
	 *  return:void
	 */
	private void arrange() {
		init();
		autoPlan();
	}

	/*
	 * 初始化数据。
	 *  return:void
	 */
	private void init() {
		students = null;
		classRooms = null;
		courses = null;
		majors = null;
		majorsCourse = null;
		schoolClasses = null;
		teachers = null;
		coursePlan = new ArrayList<CoursePlanItem>();
		ccp = new ArrayList<ClassCoursePara>();

		students = studentService.allStudent();
		classRooms = classRoomService.allClassRoom();
		courses = courseService.allCourse();
		majors = majorService.allMajor();
		majorsCourse = majorsCourseService.allMajorsCourse();
		schoolClasses = schoolClassService.allSchoolClass();
		teachers = teacherService.allTeacher();
	}

	/*
	 * 检查班级课程是否还没有排完。 mc：这个班级所属专业的所有课程 
	 * sc：班级 
	 * return :	 true:此专业还有未安排的课程,false:已经排列完所有课程
	 */
	private boolean checkCourse(List<MajorsCourse> mc, SchoolClass sc) {
		Iterator<MajorsCourse> iter = mc.iterator();
		MajorsCourse msc;
		while (iter.hasNext()) {
			msc = iter.next();
			// System.out.println(msc.getCourse().getCourseName() + "-->" +
			// msc.getParagraph() + "-->" + getPlanPara(sc.getScID(),
			// msc.getCourse().getCourseID()));
			if (msc.getParagraph() > getPlanPara(sc.getScID(), msc.getCourse()
					.getCourseID())) {
				// System.out.println(msc.getCourse().getCourseName() + "-->" +
				// msc.getParagraph() + "-->" + sc.getPlanPara());
				return true; //
			}
		}
		System.out.println(sc.getMajor().getMajorName() + sc.getScName()
				+ "班 over!  ————————   " + mc.size());
		return false;
	}

	/*
	 * 从所有的课程表中根据第几节课取出课程。 paragraph：第几节课 return : 返回当前节数的所有课程表原子
	 */
	private List<CoursePlanItem> getCoursePlanByParagraph(int paragraph) { //
		List<CoursePlanItem> _list = new ArrayList<CoursePlanItem>();
		Iterator<CoursePlanItem> _iter = coursePlan.iterator();
		CoursePlanItem _cpi;
		// System.out.println(coursePlan.size() +
		// "______________________________***");
		while (_iter.hasNext()) {
			_cpi = _iter.next();
			// System.out.println(_cpi.getCpID() + "_>_" +
			// _cpi.getCourse().getCourseName() + "_>_" + _cpi.getCpParagraph()
			// + "_>_" + paragraph);
			if (_cpi.getCpParagraph() == paragraph) {
				_list.add(_cpi);
			}
		}
		return _list;
	}

	/*
	 * 根据班级编号和课程编号在课程表中查看此班级的这门课是否已经有教师。 courseID：课程编号 scID：班级编号 return
	 * ：null-表示没有教师，将获取一个新教师。否则使用返回的教师
	 */
	private Teacher findTeacher(int courseID, int scID) {
		// System.out.println("_________________________");
		Iterator<CoursePlanItem> _cpiIter = coursePlan.iterator();
		CoursePlanItem _cpi;
		Teacher _teacher = null;
		while (_cpiIter.hasNext()) {
			_cpi = _cpiIter.next();
			if (_cpi.getCourse().getCourseID() == courseID
					&& _cpi.getSchoolClass().getScID() == scID) {
				_teacher = _cpi.getTeacher();
				break;
			}
		}
		return _teacher;
	}

	/*
	 * 获取一个可用的教师。 c:课程 sc:班级 paragraph:那节课 return：返回一个可以用的教师
	 */
	private Teacher getAvailableTeacher(Course c, SchoolClass sc, int paragraph) {
		// System.out.println(c.getTeachers());
		List<Teacher> _teachers = new ArrayList<Teacher>(c.getTeachers());
		Teacher t = null;
		Boolean b = true;
		Iterator<Teacher> _iter = _teachers.iterator();
		List<CoursePlanItem> _list = getCoursePlanByParagraph(paragraph);
		t = findTeacher(c.getCourseID(), sc.getScID());
		if (null != t) {
			return t;
		}
		if (0 == _list.size()) {
			int index = new Random().nextInt(_teachers.size());
			return _teachers.get(index);
		}
		Iterator<CoursePlanItem> _cpiIter = _list.iterator();
		while (_iter.hasNext()) {
			t = _iter.next();
			b = true;
			while (_cpiIter.hasNext()) {
				if (_cpiIter.next().getTeacher().getTeacID() == t.getTeacID()) {
					b = false;
					break;
				}
			}
			if (b)
				return t;
		}
		System.out.println("师资力量不够强大啊！没教师了。第" + rePlanCount
				+ "次重新排列中..........");
		rePlanCount++;
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		arrange();
		return null;
	}

	/*
	 * 获取同一类型的所有教室。 roomType:教室类型 return：返回此类型的所有教室
	 */
	private List<ClassRoom> getRoomByType(int roomType) {
		List<ClassRoom> _rooms = new ArrayList<ClassRoom>();
		ClassRoom _cr = null;
		Iterator<ClassRoom> _iter = classRooms.iterator();
		while (_iter.hasNext()) {
			_cr = _iter.next();
			if (_cr.getCrType() == roomType) {
				_rooms.add(_cr);
			}
		}
		return _rooms;
	}

	/*
	 * 查看此班级的此课程是否已经排过一次，获取一样的教室。 courseID：课程编号 scID：班级编号
	 * return：null-将获取一个新的教室。否则用此教室
	 */
	private ClassRoom findClassRoom(int courseID, int scID) {
		ClassRoom _classRoom = null;
		Iterator<CoursePlanItem> _cpiIter = coursePlan.iterator();
		CoursePlanItem _cpi;
		while (_cpiIter.hasNext()) {
			_cpi = _cpiIter.next();
			if (_cpi.getCourse().getCourseID() == courseID
					&& _cpi.getSchoolClass().getScID() == scID) {
				_classRoom = _cpi.getClassRoom();
			}
		}
		return _classRoom;
	}

	/*
	 * 根据教室类型和上课时间获取一个可用的教室。 courseID：课程编号 scID：班级编号 roomType：教室类型 paragraph：第几节课
	 * return：返回一个这个时间段可以使用的教室
	 */
	private ClassRoom getAvailableClassRoom(int courseID, int scID,
			int roomType, int paragraph) {
		List<CoursePlanItem> _list = getCoursePlanByParagraph(paragraph);
		List<ClassRoom> _classRooms = getRoomByType(roomType);
		ClassRoom _cr = findClassRoom(courseID, scID);
		if (null != _cr)
			return _cr;
		boolean b = true;
		if (0 == _list.size()) {
			int index = new Random().nextInt(_classRooms.size());
			return _classRooms.get(index);
		}
		Iterator<CoursePlanItem> _cpiIter = _list.iterator();
		CoursePlanItem _cpi;
		Iterator<ClassRoom> _crIter = _classRooms.iterator();
		while (_crIter.hasNext()) {
			b = true;
			_cr = _crIter.next();
			while (_cpiIter.hasNext()) {
				_cpi = _cpiIter.next();
				if (_cpi.getClassRoom().getCrID() == _cr.getCrID()) {
					// System.out.println(_cpi.getCpParagraph() + " " +
					// paragraph + " " + _cpi.getClassRoom().getCrID() +
					// "_______________________________________" +
					// _cr.getCrID());
					b = false;
					break;
				}
			}
			if (b)
				return _cr;
		}
		System.out.println("该拨款了！没教室上课了。第" + rePlanCount + "次重新排列中.........");
		rePlanCount++;
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		arrange();
		return null;
	}

	/*
	 * 通过专业编号获取此专业的所有课程。 majorID：专业编号 return：此专业的所有课程
	 */
	private List<MajorsCourse> getMajorsCourseByMajorId(int majorID) {
		List<MajorsCourse> _mscs = new ArrayList<MajorsCourse>();
		Iterator<MajorsCourse> _mcIter = majorsCourse.iterator();
		MajorsCourse _msc = null;
		while (_mcIter.hasNext()) {
			_msc = _mcIter.next();
			if (_msc.getMajor().getMajorID() == majorID)
				_mscs.add(_msc);
		}
		return _mscs;
	}

	/*
	 * 此班级的此门课程是否已经排列在课程表中。 scID：班级编号 cID：课程编号 return：true-排列过，false-没有排列过
	 */
	private boolean findPlanPara(int scID, int cID) {
		if (ccp.size() == 0)
			return false;
		ClassCoursePara _ccp;
		Iterator<ClassCoursePara> _ccpIter = ccp.iterator();
		while (_ccpIter.hasNext()) {
			_ccp = _ccpIter.next();
			if (_ccp.getcID() == cID && _ccp.getScID() == scID) {
				return true;
			}
		}
		return false;
	}

	/*
	 * 根据班级编号，课程编号查找安排课程节数。 scID：班级编号 cID：课程编号 return：当前班级的此课程已经排列了多少节
	 */
	private int getPlanPara(int scID, int cID) {
		int count = 0;
		ClassCoursePara _ccp;
		if (!findPlanPara(scID, cID)) {
			_ccp = new ClassCoursePara();
			_ccp.setScID(scID);
			_ccp.setcID(cID);
			_ccp.setPlanPara(0);
			ccp.add(_ccp);
			// while(true)System.out.println("new insert!" + ccp.size());
			return 0;
		}
		Iterator<ClassCoursePara> _ccpIter = ccp.iterator();
		while (_ccpIter.hasNext()) {
			_ccp = _ccpIter.next();
			if (_ccp.getcID() == cID && _ccp.getScID() == scID) {
				count = _ccp.getPlanPara();
				// System.out.println(count + "_________++++++++_____");
				break;
			}
		}
		return count;
	}

	/*
	 * 根据班级编号，课程编号设置安排课程节数。 scID：班级编号 cID：课程编号 para：课程的节数 return：void
	 */
	private void setPlanPara(int scID, int cID, int para) {
		ClassCoursePara _ccp;
		if (!findPlanPara(scID, cID)) {
			_ccp = new ClassCoursePara();
			_ccp.setScID(scID);
			_ccp.setcID(cID);
			_ccp.setPlanPara(para);
			ccp.add(_ccp);
			return;
		}
		Iterator<ClassCoursePara> _ccpIter = ccp.iterator();
		while (_ccpIter.hasNext()) {
			_ccp = _ccpIter.next();
			if (_ccp.getcID() == cID && _ccp.getScID() == scID) {
				_ccp.setPlanPara(para);
				// System.out.println(para + "_________________________________"
				// + _ccp.getPlanPara());
				break;
			}
		}
	}

	/*
	 * 自动排课开始方法。 return：void
	 */
	private void autoPlan() {
		System.out.println("--------------start!");
		Random rand = new Random();
		CoursePlanItem cpi = null;
		int index, paragraph = 1;
		SchoolClass sc = null;
		Teacher t = null;
		ClassRoom cr = null;
		Major major = null;
		Course course = null;
		// List<Course> specCourse = null; //某专业的所有课程
		MajorsCourse msc = null;
		List<MajorsCourse> majorsCourse = null; // 某专业与其课程的对应关系
		// System.out.println(schoolClasses.size() +
		// "***************************************************88");
		Iterator<SchoolClass> scIter = schoolClasses.iterator();
		while (scIter.hasNext()) {
			sc = scIter.next();
			paragraph = 1;
			major = sc.getMajor();
			majorsCourse = getMajorsCourseByMajorId(major.getMajorID());
			// System.out.println(checkCourse(majorsCourse, sc) +
			// "_____________________________________----");
			while (checkCourse(majorsCourse, sc)) {
				// System.out.println("AAAAAAAAAAAAAAAAAAAA");
				// System.out.println(index + " _    " + majorsCourse.size());
				// System.out.println(msc.getCourse().getCourseName() + "  " +
				// msc.getParagraph() + "      " + msc.getPlanPara());
				// System.out.println("**" + msc.getParagraph() + "->" +
				// msc.getPlanPara());
				index = rand.nextInt(majorsCourse.size()); // 随机取课进行排列
				msc = majorsCourse.get(index);
				course = msc.getCourse();
				if (msc.getParagraph() > getPlanPara(sc.getScID(),
						course.getCourseID())) { // 如果取出的课程尚未排完
					// System.out.println("AAAAAAAA");
					t = getAvailableTeacher(course, sc, paragraph);
					cr = getAvailableClassRoom(course.getCourseID(),
							sc.getScID(), course.getRoomType(), paragraph);
					cpi = new CoursePlanItem();
					cpi.setClassRoom(cr);
					cpi.setCourse(course);
					cpi.setCpParagraph(paragraph);
					cpi.setSchoolClass(sc);
					cpi.setTeacher(t);
					coursePlan.add(cpi);
					setPlanPara(sc.getScID(), course.getCourseID(),
							getPlanPara(sc.getScID(), course.getCourseID()) + 1);
					// System.out.println("**" + msc.getParagraph() + "->" +
					// msc.getPlanPara());
					// System.out.println("**" +
					// majorsCourse.get(index).getParagraph() + "->" +
					// majorsCourse.get(index).getPlanPara());
					// System.out.println(major + " " + sc + "__" + course +
					// "__" + t + "_____ " + cr + "______" + paragraph);
					// System.out.println(major.getMajorName() + sc.getScName()
					// + "__" + course.getCourseName() + "__" + t.getTeacName()
					// + "_____ " + cr.getCrName() + "______" + paragraph);
					paragraph++;
				}
			}
		}
	}

	/*
	 * 清空数据库表中的所有数据。return：void
	 */
	public void deleteAll() {
		coursePlanItemService.deleteAll();
		clean();
	}

	/*
	 * 全部清空 return：void
	 */
	public void clean() {
		students = null;
		classRooms = null;
		courses = null;
		majors = null;
		majorsCourse = null;
		schoolClasses = null;
		teachers = null;
		coursePlan = null;
		ccp = null;

		classRoomService = null;
		courseService = null;
		coursePlanItemService = null;
		majorService = null;
		schoolClassService = null;
		studentService = null;
		teacherService = null;
		majorsCourseService = null;
	}

	/*
	 * 一大陀getter和setter方法的开始，你尽情的往下滚，我会提示你 "这坨" 的结束位置的。
	 */
	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public List<ClassRoom> getClassRooms() {
		return classRooms;
	}

	public void setClassRooms(List<ClassRoom> classRooms) {
		this.classRooms = classRooms;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public List<Major> getMajors() {
		return majors;
	}

	public void setMajors(List<Major> majors) {
		this.majors = majors;
	}

	public List<MajorsCourse> getMajorsCourse() {
		return majorsCourse;
	}

	public void setMajorsCourse(List<MajorsCourse> majorsCourse) {
		this.majorsCourse = majorsCourse;
	}

	public List<SchoolClass> getSchoolClasses() {
		return schoolClasses;
	}

	public void setSchoolClasses(List<SchoolClass> schoolClasses) {
		this.schoolClasses = schoolClasses;
	}

	public List<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}

	public List<CoursePlanItem> getCoursePlan() {
		return coursePlan;
	}

	public void setCoursePlan(List<CoursePlanItem> coursePlan) {
		this.coursePlan = coursePlan;
	}

	public List<ClassCoursePara> getCcp() {
		return ccp;
	}

	public void setCcp(List<ClassCoursePara> ccp) {
		this.ccp = ccp;
	}

	public IClassRoomService getClassRoomService() {
		return classRoomService;
	}

	@Resource(name = "classRoomService")
	public void setClassRoomService(IClassRoomService classRoomService) {
		this.classRoomService = classRoomService;
	}

	public ICourseService getCourseService() {
		return courseService;
	}

	@Resource(name = "courseService")
	public void setCourseService(ICourseService courseService) {
		this.courseService = courseService;
	}

	public ICoursePlanItemService getCoursePlanItemService() {
		return coursePlanItemService;
	}

	@Resource(name = "coursePlanItemService")
	public void setCoursePlanItemService(
			ICoursePlanItemService coursePlanItemService) {
		this.coursePlanItemService = coursePlanItemService;
	}

	public IMajorService getMajorService() {
		return majorService;
	}

	@Resource(name = "majorService")
	public void setMajorService(IMajorService majorService) {
		this.majorService = majorService;
	}

	public ISchoolClassService getSchoolClassService() {
		return schoolClassService;
	}

	@Resource(name = "schoolClassService")
	public void setSchoolClassService(ISchoolClassService schoolClassService) {
		this.schoolClassService = schoolClassService;
	}

	public IStudentService getStudentService() {
		return studentService;
	}

	@Resource(name = "studentService")
	public void setStudentService(IStudentService studentService) {
		this.studentService = studentService;
	}

	public ITeacherService getTeacherService() {
		return teacherService;
	}

	@Resource(name = "teacherService")
	public void setTeacherService(ITeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public IMajorsCourseService getMajorsCourseService() {
		return majorsCourseService;
	}

	@Resource(name = "majorsCourseService")
	public void setMajorsCourseService(IMajorsCourseService majorsCourseService) {
		this.majorsCourseService = majorsCourseService;
	}

	/*
	 * 这坨setter和getter终于结束了
	 */
	private int rePlanCount = 1;

	private List<Student> students = null;
	private List<ClassRoom> classRooms = null;
	private List<Course> courses = null;
	private List<Major> majors = null;
	private List<MajorsCourse> majorsCourse = null;
	private List<SchoolClass> schoolClasses = null;
	private List<Teacher> teachers = null;
	private List<CoursePlanItem> coursePlan = null;
	private List<ClassCoursePara> ccp = null;

	private IClassRoomService classRoomService;
	private ICourseService courseService;
	private ICoursePlanItemService coursePlanItemService;
	private IMajorService majorService;
	private ISchoolClassService schoolClassService;
	private IStudentService studentService;
	private ITeacherService teacherService;
	private IMajorsCourseService majorsCourseService;

}