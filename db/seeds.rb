# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Insert Roles
normal_role = Role.create(name: 'normal', display_name: 'Normal User')
student_role = Role.create(name: 'student', display_name: 'Student')
teacher_role = Role.create(name: 'teacher', display_name: 'Teacher')
supervisor_role = Role.create(name: 'supervisor', display_name: 'Supervisor')
admin_role = Role.create(name: 'admin', display_name: 'Administrator')

# Insert Admin User
admin_user = User.new(first_name: 'Ammar', last_name: 'Baghmeyan',
                      username: 'baghmeyan', password: '123456',
                      email: 'ammar1992ye@gmail.com', is_active: true)
admin_role.user = admin_user

################################### Teacher ###################################
#-------------------------------------------------------------------------------
teacher_user1 = User.new(first_name: 'Amen', last_name: 'Al-Shuiby',
                         username: 'aShuiby', password: '123456',
                         email: 'amen@gmail.com',
                         role: teacher_role)
#-------------------------------------------------------------------------------
teacher_user2 = User.new(first_name: 'Yaser', last_name: 'Badokhen',
                         username: 'yBadokhen', password: '123456',
                         email: 'yaser@gmail.com',
                         role: teacher_role)
#-------------------------------------------------------------------------------
################################# Academic Year ################################
#-------------------------------------------------------------------------------
academic_year = AcademicYear.new(name: 'Academic Year from 2020 - 2021',
                                 year: DateTime.now)
academic_year.save
#-------------------------------------------------------------------------------
################################# Academic Level ###############################
#-------------------------------------------------------------------------------
academic_level = AcademicLevel.new(name: 'First Primary')
academic_year.academic_levels << academic_level
#-------------------------------------------------------------------------------
##################################### Course ###################################
#-------------------------------------------------------------------------------
quran_kareem = Course.create(name: 'Quran Kareem', description: '')
islamic = Course.create(name: 'Islamic', description: '')
arabic = Course.create(name: 'Arabic', description: '')
mathematics = Course.create(name: 'Mathematics', description: '')
sciences = Course.create(name: 'Sciences', description: '')
english = Course.create(name: 'English', description: '')
#-------------------------------------------------------------------------------
############################# Academic Level Courses ###########################
#-------------------------------------------------------------------------------
academic_level_courses1 = AcademicLevelCourse.create(academic_level: academic_level,
                                                     course: quran_kareem)
academic_level_courses2 = AcademicLevelCourse.create(academic_level: academic_level,
                                                     course: islamic)
academic_level_courses3 = AcademicLevelCourse.create(academic_level: academic_level,
                                                     course: arabic)
academic_level_courses4 = AcademicLevelCourse.create(academic_level: academic_level,
                                                     course: mathematics)
academic_level_courses5 = AcademicLevelCourse.create(academic_level: academic_level,
                                                     course: sciences)
#-------------------------------------------------------------------------------
################################ Teacher Courses ###############################
#-------------------------------------------------------------------------------
teacher1 = Teacher.new
teacher2 = Teacher.new
teacher_user1.teacher = teacher1
teacher_user2.teacher = teacher2
teacher1_course1 = TeacherCourse.create(teacher: teacher1,
                                        academic_level_course: academic_level_courses1)
teacher1_course2 = TeacherCourse.create(teacher: teacher1,
                                        academic_level_course: academic_level_courses2)
teacher2_course3 = TeacherCourse.create(teacher: teacher2,
                                        academic_level_course: academic_level_courses3)
teacher2_course4 = TeacherCourse.create(teacher: teacher2,
                                        academic_level_course: academic_level_courses4)
#-------------------------------------------------------------------------------
##################################### Semester ##################################
#-------------------------------------------------------------------------------
semester = Semester.new(name: 'First Semester 2020')
academic_level.semester = semester
#-------------------------------------------------------------------------------
################################### Students ###################################
#-------------------------------------------------------------------------------
student_user1 = User.create(first_name: 'Salem', last_name: 'Bawazeer',
                            username: 'sBawazeer', password: '123456',
                            email: 'salem@gmail.com',
                            role: student_role)
#-------------------------------------------------------------------------------
student_user2 = User.create(first_name: 'Ali', last_name: 'Batheeb',
                            username: 'aBatheeb', password: '123456',
                            email: 'ali@gmail.com',
                            role: student_role)
#-------------------------------------------------------------------------------
student_user3 = User.create(first_name: 'Khaled', last_name: 'Bankher',
                            username: 'kBankher', password: '123456',
                            email: 'khaled@gmail.com',
                            role: student_role)
#-------------------------------------------------------------------------------
################################# Add To Semester##############################\
student1 = Student.create(user: student_user1)
student2 = Student.create(user: student_user2)
student3 = Student.create(user: student_user3)

semester.students << student1
semester.students << student2
semester.students << student3