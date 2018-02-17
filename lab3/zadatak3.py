import os
import re


def main():
    students = {}
    jmbag_list = []
    with open("studenti.txt", "r") as students_file:
        lines = students_file.readlines()
        for line in lines:
            jmbag, last_name, first_name = line.strip().split(" ")
            students[jmbag] = {"first": first_name, "last": last_name}
            jmbag_list.append(jmbag)
    files = os.listdir(".")

    exercises = []
    for file_name in files:
        if not re.match('(Lab_[0-9]+_g[0-9]+.txt)', file_name):
            continue
        with open(file_name, "r") as file:
            lines = file.readlines()
            exercise = int(file_name.split("_")[1])
            if exercise not in exercises:
                exercises.append(exercise)
            for line in lines:
                elems = line.split(" ")
                if not students.get(elems[0], 0).get(exercise, 0):
                    students[elems[0]][exercise] = float(elems[1])
                else:
                    print(students[elems[0]]["first"],
                          students[elems[0]]["last"],
                          "je vec pristupio vjezbi ",
                          str(exercise) + ".")

    print("JMBAG       Prezime, Ime       ", end='')
    for i in range(1, len(exercises) + 1):
        print("     L" + str(i), end='')
    print()
    for jmbag in jmbag_list:
        print(jmbag + "  " + "%-20s" % (students[jmbag]["last"] + ", " + students[jmbag]["first"]), end='')
        for j in range(1, len(exercises) + 1):
            print("    " + "%-3.1f" % (students.get(jmbag, 0).get(j, 0)), end='')
        print("")


if __name__ == '__main__':
    main()
