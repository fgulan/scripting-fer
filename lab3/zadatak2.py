def main():
    print("Hyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90")
    file = open("ulaz.txt", "r")
    lines = file.readlines()

    counter = 1
    for line in lines:
        line = [float(x) for x in line.strip().split(' ')]
        line.sort()
        l = len(line)
        print(("%03d" % counter), end="")
        for i in (x / 10 for x in range(1, 10)):
            index = int(round(i * l))
            print("#" + str(line[index]), end="")
        counter += 1
        print("")


if __name__ == "__main__":
    main()
