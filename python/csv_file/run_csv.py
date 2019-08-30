import csv
import operator
num = dict()
with open('employee_birthday.txt') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    print(csv_reader)
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            line_count += 1
        else:
            num.update({row[0]:row[4]})
            print(f'\t{row[0]}:{row[1]} works in the {row[2]} department, and was born in {row[3]} and salary: {row[4]}.')
            line_count += 1
    print(f'Processed {line_count} lines.')

print(sorted(num.items(), key=lambda kv: int(kv[1]), reverse=True))
for i in [key for (key, value) in sorted(num.items(), key=lambda kv: int(kv[1]), reverse=True)]:
    print(i)

with open('employee_birthday.txt', mode='r') as csv_file:
    csv_reader = csv.DictReader(csv_file)
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            line_count += 1
        print(f'\t{row["name"]} works in the {row["department"]} department,'
         'and was born in {row["birthday month"]}.')
        line_count += 1
    print(f'Processed {line_count} lines.')

with open('employee_file.csv', mode='w') as employee_file:
    employee_writer = csv.writer(employee_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

    employee_writer.writerow(['John Smith', 'Accounting', 'November'])
    employee_writer.writerow(['Erica Meyers', 'IT', 'March'])
