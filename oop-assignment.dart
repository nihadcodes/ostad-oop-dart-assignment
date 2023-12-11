abstract class Role {
  void displayRole();
}


class Person implements Role {
  String? name;
  int? age;
  String? address;

  Person(String name, int age, String address) {
    this.name = name;
    this.age = age;
    this.address = address;
  }

  @override
  void displayRole() {
    print('Role: Undefined');
  }
}


class Student extends Person {
  int? studentID;
  String? grade;
  List<double>? courseScores;

  Student(String name, int age, String address, int studentID, String grade)
      : super(name, age, address) {
    this.studentID = studentID;
    this.grade = grade;
    courseScores = [];
  }

  void addCourseScore(double score) {
    courseScores!.add(score);
  }

  double calculateAverageScore() {
    if (courseScores!.isEmpty) return 0.0;
    double sum = courseScores!.reduce((value, element) => value + element);
    return sum / courseScores!.length;
  }

  @override
  void displayRole() {
    print('Role: Student');
  }
}


class Teacher extends Person {
  int? teacherID;
  List<String>? coursesTaught;

  Teacher(String name, int age, String address, int teacherID, List<String> coursesTaught)
      : super(name, age, address) {
    this.teacherID = teacherID;
    this.coursesTaught = coursesTaught;
  }

  @override
  void displayRole() {
    print('Role: Teacher');
  }
}


void main() {
  
  var student = Student('John Doe', 20, '123 Main St', 1001, 'Grade 10');
  student.addCourseScore(90);
  student.addCourseScore(85);
  student.addCourseScore(82);

  var teacher = Teacher('Mrs. Smith', 35, '456 Oak St', 2001, ['Math', 'English', 'Bangla']);

  
  displayInformation(student);
  displayInformation(teacher);
}


void displayInformation(Person person) {
  print('\n${person is Student ? 'Student Information:' : 'Teacher Information:'}');
  person.displayRole();
  print('Name: ${person.name ?? 'N/A'}');
  print('Age: ${person.age ?? 'N/A'}');
  print('Address: ${person.address ?? 'N/A'}');

  if (person is Student) {
    var student = person as Student;
    print('Average Score: ${student.calculateAverageScore()}');
  } else if (person is Teacher) {
    var teacher = person as Teacher;
    print('Courses Taught:');
    if (teacher.coursesTaught != null) {
      for (var course in teacher.coursesTaught!) {
        print('- $course');
      }
    }
  }
}
