abstract class Role {
  void displayRole();
}


class Person implements Role {
  String name;
  int age;
  String address;
  Role? role;

  Person(this.name, this.age, this.address, this.role);


  String getName() => name;
  int getAge() => age;
  String getAddress() => address;
  Role? getRole() => role;

  
  void displayRole() {
    role?.displayRole();
  }
}


class Student extends Person implements Role {
  String studentID;
  String grade;
  List<int> courseScores;

  Student(String name, int age, String address, this.studentID, this.grade, this.courseScores)
      : super(name, age, address, null) {
    role = this;
  }

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }

  void displayStudentInfo() {
    print("Student Information:");
    print("---------------------");
    displayRole();
    print("Name: ${getName()}");
    print("Age: ${getAge()}");
    print("Address: $address");
    print("Average Score: ${calculateAverageScore().toStringAsFixed(1)}");
  }
}

class Teacher extends Person implements Role {
  String teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address, null) {
    role = this;
  }

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }

  void displayTeacherInfo() {
    print("\nTeacher Information:");
    print("---------------------");
    displayRole();
    print("Name: ${getName()}");
    print("Age: ${getAge()}");
    print("Address: $address");
    displayCoursesTaught();
  }
}


class StudentManagementSystem {
  static void main() {

    var student = Student(
      "John Doe",
      20,
      "123 Main St",
      "S1001",
      "A",
      [90, 85, 92],
    );
    
 
    var teacher = Teacher(
      "Mrs. Smith",
      35,
      "456 Oak St",
      "T2001",
      ["Math", "English", "Bangla"],
    );

  
    student.displayStudentInfo();

 
    teacher.displayTeacherInfo();
  }
}

void main() {
  StudentManagementSystem.main();
}