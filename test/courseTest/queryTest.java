package courseTest;

import java.util.List;

import com.github.mahui53541.srs.service.ProfessorService;
import com.github.mahui53541.srs.serviceImpl.ProfessorServiceImpl;
public class queryTest {
	/*private static CourseService courseService;*/
	private static ProfessorService pc;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*courseService=new CourseServiceImpl();
		List<Course> list=courseService.queryCourse();*/
		pc=new ProfessorServiceImpl();
		
		System.out.println(pc.queryProfessor());
		
	}

}
