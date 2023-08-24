from faker import Faker
from datetime import datetime, timedelta
from random import randint 
import sqlite3

fake = Faker()


TEACHERS = 5
STUDENTS = 30
groups = ['Group A', 'Group B', 'Group C'] 
disciplines = [
    'Math', 
    'Physics', 
    'Chemistry', 
    'Biology', 
    'History']

connect = sqlite3.connect('hw_6.db')
cur = connect.cursor()

def add_teachers():
    query = "INSERT INTO teachers (fullname) VALUES (?);"
    teachers = [fake.name() for _ in range(TEACHERS)]
    cur.executemany(query, zip(teachers,))


def add_disciplines():
    query = "INSERT INTO disciplines(discipline, teacher_id) VALUES(?, ?);"
    cur.executemany(query, zip(disciplines, iter(randint(1, TEACHERS) for _ in range(len(disciplines)))))

def add_groups():
    query = "INSERT INTO groups(name) VALUES (?);"
    cur.executemany(query, zip(groups,))

def add_students():
    query = "INSERT INTO students (fullname, group_id) VALUES (?, ?);"
    students = [fake.name() for _ in range(STUDENTS)]
    cur.executemany(query, zip(students, iter(randint(1, len(groups)) for _ in range(len(students)))))


def seed_grades():
    query = "INSERT INTO grades(discipline_id, student_id, grade, date_of) VALUES(?, ?, ?, ?);"
    start_date = datetime.strptime("2023-08-23", "%Y-%m-%d")
    end_date = datetime.strptime("2023-12-31", "%Y-%m-%d")
    

    def get_list_date(start: datetime, end: datetime) -> list[datetime]:
        result = list()
        current_date = start
        while current_date <= end:
            if current_date.isoweekday() < 6:
                result.append(current_date)
            current_date += timedelta(1)
        return result

    list_dates = get_list_date(start_date, end_date)

    grades = list()
    for day in list_dates:
        random_discipline = randint(1, len(disciplines))
        random_students = [randint(1, STUDENTS) for _ in range(5)]
        for student in random_students:
            grades.append((random_discipline, student, randint(1, 12), day.date()))
    cur.executemany(query, grades)


if __name__ == '__main__':
    add_teachers()
    add_disciplines()
    add_groups()
    add_students()
    seed_grades()
    connect.commit()
