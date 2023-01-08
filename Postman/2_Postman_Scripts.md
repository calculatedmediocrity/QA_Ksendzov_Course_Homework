# HW_2 Postman

###### http://162.55.220.72:5005/first
1. Отправить запрос. 
Method: GET
EndPoint: /first

2. Статус код 200
```javascript
pm.test("Status code is 200", function () {
	pm.response.to.have.status(200);
});
```
3. Проверить, что в body приходит правильный string.
```javascript
// pm.test("Body matches string", function () {
//     pm.expect(pm.response.text()).to.include("This is the first responce from server!");
// });
pm.test("Body matches string", function () {
    var responseText = pm.response.text();
    pm.expect(responseText).to.be.a("string");
});
```

###### http://162.55.220.72:5005/user_info_3
1. Отправить запрос. 
(method: POST
request form data: name: str, age: int, salary: int)
2. Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
3. Спарсить response body в json.
```javascript
var responseJson = pm.response.json();
```
4. Проверить, что name в ответе равно name s request (name вбить руками.)
```javascript
pm.test("Name is Adelle", () => {
    pm.expect(responseJson.name).to.eql("Adelle");
});
```
5. Проверить, что age в ответе равно age s request (age вбить руками.)
```javascript
// console.log(typeof(responseJson.age)); - to check if age is a String type
pm.test("Age is 35", () => {
    pm.expect(responseJson.age).to.eql("35");
});
```
6. Проверить, что salary в ответе равно salary s request (salary вбить руками.)
```javascript
// console.log(typeof(responseJson.salary)); - to check if salary is a Number
pm.test("Salary is 1000", () => {
    pm.expect(responseJson.salary).to.eql(1000);
});
```
7. Спарсить request.
```javascript
var requestBody = request.data;
```
8. Проверить, что name в ответе равно name s request (name забрать из request.)
```javascript
pm.test("Name from response equals name from request", () => {
    pm.expect(responseJson.name).to.eql(requestBody.name);
});
// pm.test("Name from response equals name from request (manually)", () => {
//     pm.expect("Dmitry").to.eql(requestBody.name);
// });
```
9. Проверить, что age в ответе равно age s request (age забрать из request.)
```javascript
pm.test("Age from response equals age from request", () => {
    pm.expect(responseJson.age).to.eql(requestBody.age);
});
```
10. Проверить, что salary в ответе равно salary s request (salary забрать из request.)
```javascript
pm.test("Salary from response equals salary from request", () => {
	pm.expect(parseInt(responseJson.salary)).to.eql(parseInt(requestBody.salary));
});
```
11. Вывести в консоль параметр family из response.
```javascript
console.log(responseJson.family);
```
12. Проверить что u_salary_1_5_year в ответе равно salary*4 (salary забрать из request)
```javascript
pm.test("Salary in 4 years from response equals salary*4", () => {
	pm.expect(responseJson.family.u_salary_1_5_year).to.eql(requestBody.salary * 4);
});
```

###### http://162.55.220.72:5005/object_info_3
1. Отправить запрос.
(method: GET
params: name: str, age: int, salary: int)
2. Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
3. Спарсить response body в json.
```javascript
var responseJson = pm.response.json();
```
4. Спарсить request.
```javascript
var requestParams = pm.request.url.query.toObject();
```
5. Проверить, что name в ответе равно name s request (name забрать из request.)
```javascript
pm.test("Name from response equals name from request", () => {
    pm.expect(responseJson.name).to.eql(requestParams.name);
});
```
6. Проверить, что age в ответе равно age s request (age забрать из request.)
```javascript
pm.test("Age from response equals age from request", () => {
    pm.expect(responseJson.age).to.eql(requestParams.age);
});
```
7. Проверить, что salary в ответе равно salary s request (salary забрать из request.)
```javascript
pm.test("Salary from response equals salary from request", () => {
    pm.expect(responseJson.salary).to.eql(parseInt(requestParams.salary));
});
```
8. Вывести в консоль параметр family из response.
```javascript
console.log(responseJson.family);
```
9. Проверить, что у параметра dog есть параметры name.
```javascript
pm.test("Dog parameter has a Name parameter", () => {
    pm.expect(pm.response.json("dog")).to.have.property("name");
});
// pm.test("Dog parameter has a Name parameter", () => {
//     pm.expect(responseJson.family.pets.dog).to.have.property("name");
// });
```
10. Проверить, что у параметра dog есть параметры age.
```javascript
pm.test("Dog parameter has an Age parameter", () => {
    pm.expect(pm.response.json("dog")).to.have.property("age");
});
```
11. Проверить, что параметр name имеет значение Luky.
```javascript
pm.test("Name equals 'Luky'", () => {
    pm.expect(responseJson.family.pets.dog.name).to.eql("Luky");
});
```
12. Проверить, что параметр age имеет значение 4.
```javascript
pm.test("Age equals 4", () => {
    pm.expect(responseJson.family.pets.dog.age).to.eql(4);
});
```

###### http://162.55.220.72:5005/object_info_4
1. Отправить запрос.
(method GET
params: name: str, age: int, salary: int)
2. Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
3. Спарсить response body в json.
```javascript
var responseJson = pm.response.json();
```
4. Спарсить request.
```javascript
var requestParams = pm.request.url.query.toObject();
```
5. Проверить, что name в ответе равно name s request (name забрать из request.)
```javascript
pm.test("Name from response equals name from request", () => {
    pm.expect(responseJson.name).to.eql(requestParams.name);
});
```
6. Проверить, что age в ответе равно age из request (age забрать из request.)
```javascript
pm.test("Age from response equals Age from request", () => {
    pm.expect(responseJson.age).to.eql(parseInt(requestParams.age));
});
```
7. Вывести в консоль параметр salary из request.
```javascript
console.log(requestParams.salary);
```
8. Вывести в консоль параметр salary из response.
```javascript
console.log(responseJson.salary);
```
9. Вывести в консоль 0-й элемент параметра salary из response.
```javascript
console.log("The first element of salary from response: " + responseJson.salary[0]);
```
10. Вывести в консоль 1-й элемент параметра salary параметр salary из response.
```javascript
console.log("The second element of salary from request: " + responseJson.salary[1]);
```
11. Вывести в консоль 2-й элемент параметра salary параметр salary из response.
```javascript
console.log("The third element of salary from request: " + responseJson.salary[2]);
```
12. Проверить, что 0-й элемент параметра salary равен salary из request (salary забрать из request.)
```javascript
pm.test("The first element of salary from response equals salary from request", () => {
    pm.expect(JSON.stringify(responseJson.salary[0])).to.eql(requestParams.salary);
})
```
13. Проверить, что 1-й элемент параметра salary равен salary*2 из request (salary забрать из request.)
```javascript
pm.test("The second element of salary from response equals salary*2 from request", () => {
    pm.expect(parseInt(responseJson.salary[1])).to.eql(parseInt(requestParams.salary) * 2);
})
```
14. Проверить, что 2-й элемент параметра salary равен salary*3 из request (salary забрать из request.)
```javascript
pm.test("The third element of salary from response equals salary*3 from request", () => {
    pm.expect(parseInt(responseJson.salary[2])).to.eql(parseInt(requestParams.salary) * 3);
})
```
15. Создать в окружении переменную name
16. Создать в окружении переменную age
17. Создать в окружении переменную salary
18. Передать в окружение переменную name
```javascript
pm.environment.set("name", requestParams.name);
```
19. Передать в окружение переменную age
```javascript
pm.environment.set("age", requestParams.age);
```
20. Передать в окружение переменную salary
```javascript
pm.environment.set("salary", requestParams.salary);
```
21. Написать цикл который выведет в консоль по порядку элементы списка из параметра salary.
```javascript
for (var i = 0; i < responseJson.salary.length; i++) {
	console.log(responseJson.salary[i]);
}
```

###### http://162.55.220.72:5005/user_info_2
1. Вставить параметр salary из окружения в request
2. Вставить параметр age из окружения в age
3. Вставить параметр name из окружения в name
4. Отправить запрос.
5. Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
6. Спарсить response body в json.
```javascript
var responseJson = pm.response.json();
```
7. Спарсить request.
```javascript
var requestParams = pm.request.url.query.toObject();
```
8. Проверить, что json response имеет параметр start_qa_salary
```javascript
pm.test("Response has start_qa_salary parameter", () => {
    pm.expect(responseJson).to.have.property("start_qa_salary");
});
```
9. Проверить, что json response имеет параметр qa_salary_after_6_months
```javascript
pm.test("Response has qa_salary_after_6_months parameter", () => {
    pm.expect(responseJson).to.have.property("qa_salary_after_6_months");
});
```
10. Проверить, что json response имеет параметр qa_salary_after_12_months
```javascript
pm.test("Response has qa_salary_after_12_months parameter", () => {
    pm.expect(responseJson).to.have.property("qa_salary_after_12_months");
});
```
11. Проверить, что json response имеет параметр qa_salary_after_1.5_year
```javascript
pm.test("Response has qa_salary_after_1.5_year parameter", () => {
    pm.expect(responseJson).to.have.property("qa_salary_after_1.5_year");
});
```
12. Проверить, что json response имеет параметр qa_salary_after_3.5_years
```javascript
pm.test("Response has qa_salary_after_3.5_years parameter", () => {
    pm.expect(responseJson).to.have.property("qa_salary_after_3.5_years");
});
```
13. Проверить, что json response имеет параметр person
```javascript
pm.test("Response has person parameter", () => {
    pm.expect(responseJson).to.have.property("person");
});
```
14. Проверить, что параметр start_qa_salary равен salary из request (salary забрать из request.)
```javascript
pm.test("start_qa_salary from response equals start_qa_salary from request", () => {
    pm.expect(responseJson.start_qa_salary).to.eql(parseInt(requestParams.salary));
});
```
15. Проверить, что параметр qa_salary_after_6_months равен salary*2 из request (salary забрать из request.)
```javascript
pm.test("qa_salary_after_6_months from response equals salary*2 from request", () => {
    pm.expect(responseJson.qa_salary_after_6_months).to.eql(parseInt(requestParams.salary) * 2);
});
```
16. Проверить, что параметр qa_salary_after_12_months равен salary*2.7 из request (salary забрать из request.)
```javascript
pm.test("qa_salary_after_12_months from response equals salary*2.7 from request", () => {
    pm.expect(responseJson.qa_salary_after_12_months).to.eql(parseInt(requestParams.salary) * 2.7);
});
```
17. Проверить, что параметр qa_salary_after_1.5_year равен salary*3.3 из request (salary забрать из request.)
```javascript
pm.test("qa_salary_after_1.5_year from response equals salary*3.3 from request", () => {
    pm.expect(responseJson["qa_salary_after_1.5_year"]).to.eql(parseInt(requestParams.salary) * 3.3);
});
// pm.test("qa_salary_after_1.5_year from response equals salary*3.3 from request", () => {
//    pm.expect(responseJson).to.have.property("qa_salary_after_1.5_year").to.eql(parseInt(requestParams.salary) * 3.3);
// });
```
18. Проверить, что параметр qa_salary_after_3.5_years равен salary*3.8 из request (salary забрать из request.)
```javascript
pm.test("qa_salary_after_3.5_years from response equals salary*3.8 from request", () => {
    pm.expect(responseJson["qa_salary_after_3.5_years"]).to.eql(parseInt(requestParams.salary) * 3.8);
});
// pm.test("qa_salary_after_3.5_years from response equals salary*3.8 from request", () => {
//     pm.expect(responseJson).to.have.property("qa_salary_after_3.5_years").to.eql(parseInt(requestParams.salary) * 3.8);
// });
```
19. Проверить, что в параметре person, 1-й элемент из u_name равен salary из request (salary забрать из request.)
```javascript
pm.test("The first (actually the second) element from u_name equals salary from request", () => {
    pm.expect(responseJson.person.u_name[1]).to.eql(parseInt(requestParams.salary));
});
```
20. Проверить, что что параметр u_age равен age из request (age забрать из request.)
```javascript
pm.test("u_age equals age from request", () => {
    pm.expect(responseJson.person.u_age).to.eql(parseInt(requestParams.age));
});
```
21. Проверить, что параметр u_salary_5_years равен salary*4.2 из request (salary забрать из request.)
```javascript
pm.test("u_salary_5_years from response equals salary*4.2 from request", () => {
    pm.expect(responseJson.person.u_salary_5_years).to.eql(parseInt(requestParams.salary) * 4.2);
});
```
22. ** *Написать цикл который выведет в консоль по порядку элементы списка из параметра person.**
```javascript
for (const key in responseJson.person) {
    console.log(`${key}: ${responseJson.person[key]}`);
}
```