# -*- coding: utf-8 -*-
from flask import Flask, request
from flask_restful import Resource, Api
from sqlalchemy import create_engine
from json import dumps
from flask_jsonpify import jsonify
# tutorial:
# https://www.codementor.io/sagaragarwal94/building-a-basic-restful-api-in-python-58k02xsiq
app = Flask(__name__)
api = Api(app)

db_connect = create_engine('sqlite:///chinook.db')


class Employees(Resource):
    def get(self):
        conn = db_connect.connect() ##kết nối với cơ sở dữ liệu
        query = conn.execute("select * from employees;") # Dòng này thực hiện truy vấn và trả về json
        return {'employees': [i[0] for i in query.cursor.fetchall()]} # Tìm và thêm cột đầu tiên là Employee ID

class Tracks(Resource):
    def get(self):
        conn = db_connect.connect() ##kết nối với cơ sở dữ liệu
        query = conn.execute("select trackid, name, composer, unitprice from tracks;")
        result = {'data': [dict(zip(tuple (query.keys()) ,i)) for i in query.cursor]}
        return jsonify(result)

class Employees_Name(Resource):
    def get(self, employee_id):
        conn = db_connect.connect() ##kết nối với cơ sở dữ liệu
        query = conn.execute("select * from employees where EmployeeId =%d "  %int(employee_id))
        result = {'data': [dict(zip(tuple (query.keys()) ,i)) for i in query.cursor]}
        return jsonify(result)


api.add_resource(Employees, '/employees') # Route_1
api.add_resource(Tracks, '/tracks') # Route_2
api.add_resource(Employees_Name, '/employees/<employee_id>') # Route_3

if __name__ == '__main__':
     app.run(debug=True)
