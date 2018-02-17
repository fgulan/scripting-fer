def load_matrix(input):
    rows = input.split('\n')
    dimension_string = rows[0].split(' ')
    dimension = (int(dimension_string[0]), int(dimension_string[1]))
    matrix = {}
    for row in rows[1:]:
        el = row.split(' ')
        matrix[(int(el[0]), int(el[1]))] = float(el[2])
    return matrix, dimension


def save_matrix(matrix, name):
    dim = matrix[1]
    mat = matrix[0]
    with open(name, "w") as file:
        file.write(str(dim[0]) + " " + str(dim[1]) + '\n')
        for key in mat.keys():
            file.write(str(key[0]) + " " + str(key[1]) + " " + str(mat[key]) + '\n')


def print_matrix(matrix):
    dim = matrix[1]
    mat = matrix[0]
    var = ''
    for i in range(1, dim[0] + 1):
        for j in range(1, dim[1] + 1):
            var += "%10g" % float(mat.get((i, j), 0))
        var += '\n'
    print(var)


def multiply_matrix(matrix_a, matrix_b):
    dim_a = matrix_a[1]
    dim_b = matrix_b[1]
    if dim_a[1] != dim_b[0]:
        exit("Matrice nisu ulancane")
    dim_c = dim_a[0], dim_b[1]
    mat_a = matrix_a[0]
    mat_b = matrix_b[0]
    mat_c = {}
    for i in range(dim_c[0] + 1):
        for j in range(dim_c[1] + 1):
            mat_c[(i, j)] = 0
            for k in range(1, dim_a[1] + 1):
                mat_c[(i, j)] += float(mat_a.get((i, k), 0) * mat_b.get((k, j), 0))
            if mat_c[(i, j)] == 0:
                del mat_c[(i, j)]
    return mat_c, dim_c


def main():
    input_file = open("matrix.txt", "r")
    matrices = input_file.read().split("\n\n");
    matrix_a = load_matrix(matrices[0])
    matrix_b = load_matrix(matrices[1])
    matrix_c = multiply_matrix(matrix_a, matrix_b)
    print_matrix(matrix_c)
    save_matrix(matrix_c, "matrix_c.txt")
    input_file.close()

if __name__ == "__main__":
    main()
