# Charles HW Traffic capture

## Ex_0:

`Protocol: http
IP: 162.55.220.72
Port: 5005`

## Ex_1:
`Method: GET
EndPoint: /get_method
request url params:
 name: str
 age: int`

response:


    [
        “Str”,
        “Str”
    ]

**Task:**
Сделать и в Rewrite, и в BreakPoint (можно отключить чтобы не стопило на каждом запросе)
 ⁃ Подменить url в Charles чтобы в запросе ушло имя которые вы вписали в Postman, а вернулось то, которое вы подставили в Charles.
###### breakpoint:
```xml
...
<breakpoint>
              <location>
                <protocol>http</protocol>
                <host>162.55.220.72</host>
                <port>5005</port>
                <path>/get_method</path>
                <query>name=Dmitry&amp;age=31</query>
              </location>
              <request>false</request>
              <response>true</response>
              <enabled>false</enabled>
</breakpoint>
...
```
###### rewrite:
```xml
...
<rewriteSet>
              <active>false</active>
              <name>Ex_01</name>
              <hosts>
                <locationPatterns>
                  <locationMatch>
                    <location>
                      <protocol>http</protocol>
                      <host>162.55.220.72</host>
                      <port>5005</port>
                      <path>/get_method</path>
                      <query>name=Dmitry&amp;age=31</query>
                    </location>
                    <enabled>true</enabled>
                  </locationMatch>
                </locationPatterns>
              </hosts>
              <rules>
                <rewriteRule>
                  <active>true</active>
                  <ruleType>9</ruleType>
                  <matchHeader>name</matchHeader>
                  <matchValue></matchValue>
                  <matchHeaderRegex>false</matchHeaderRegex>
                  <matchValueRegex>false</matchValueRegex>
                  <matchRequest>false</matchRequest>
                  <matchResponse>false</matchResponse>
                  <newHeader>name</newHeader>
                  <newValue>Not Dmitry</newValue>
                  <newHeaderRegex>false</newHeaderRegex>
                  <newValueRegex>false</newValueRegex>
                  <matchWholeValue>false</matchWholeValue>
                  <caseSensitive>false</caseSensitive>
                  <replaceType>2</replaceType>
                </rewriteRule>
              </rules>
</rewriteSet>
...
```

## Ex_2:
`Method: POST
EndPoint: /user_info_3
request form data: 
 name: str
 age: int
 salary: int`

    response: 
    {'name': name,
              'age': age,
              'salary': salary,
              'family': {'children': [['Alex', 24], ['Kate', 12]],
                         'u_salary_1_5_year': salary * 4}}

**Task:**
Сделать и в Rewrite, и в BreakPoint (можно отключить чтобы не стопило на каждом запросе)
 ⁃ Подменить body в Charles так чтобы в запросе ушла salary которую вы вписали в Postman, а в u_salary_1_5_year цифра вернулась меньше оригинальной из запроса.
###### breakpoint:
```xml
...
<breakpoint>
              <location>
                <protocol>http</protocol>
                <host>162.55.220.72</host>
                <port>5005</port>
                <path>/user_info_3</path>
              </location>
              <request>false</request>
              <response>true</response>
              <enabled>false</enabled>
</breakpoint>
...
```
###### rewrite:
```xml
...
<rewriteSet>
              <active>false</active>
              <name>Ex_02</name>
              <hosts>
                <locationPatterns>
                  <locationMatch>
                    <location>
                      <protocol>http</protocol>
                      <host>162.55.220.72</host>
                      <port>5005</port>
                      <path>/user_info_3</path>
                    </location>
                    <enabled>true</enabled>
                  </locationMatch>
                </locationPatterns>
              </hosts>
              <rules>
                <rewriteRule>
                  <active>true</active>
                  <ruleType>7</ruleType>
                  <matchValue>4000</matchValue>
                  <matchHeaderRegex>false</matchHeaderRegex>
                  <matchValueRegex>false</matchValueRegex>
                  <matchRequest>false</matchRequest>
                  <matchResponse>true</matchResponse>
                  <newValue>500</newValue>
                  <newHeaderRegex>false</newHeaderRegex>
                  <newValueRegex>false</newValueRegex>
                  <matchWholeValue>false</matchWholeValue>
                  <caseSensitive>false</caseSensitive>
                  <replaceType>2</replaceType>
                </rewriteRule>
              </rules>
</rewriteSet>
...
```

## Ex_3:
`Method: GET
EndPoint: /object_info_1
request url params: 
 name: str
 age: int
 weight: int`

response:

    {'name': name,
              'age': age,
              'daily_food': weight * 0.012,
              'daily_sleep': weight * 2.5}

**Task:**
Сделать и в Rewrite, и в BreakPoint (можно отключить чтобы не стопило на каждом запросе)
 ⁃ Подменить параметры запроса в Charles так, чтобы в Postman пришел ответ где другое name, daily_food > weight из запроса, а daily_sleep < weight из запроса.
###### breakpoint:
```xml
...
<breakpoint>
              <location>
                <protocol>http</protocol>
                <host>162.55.220.72</host>
                <port>5005</port>
                <path>/object_info_1</path>
                <query>name=Dmitry&amp;age=31&amp;weight=63</query>
              </location>
              <request>false</request>
              <response>true</response>
              <enabled>false</enabled>
</breakpoint>
...
```
###### rewrite:
```xml
...
<rewriteSet>
              <active>false</active>
              <name>Ex_03</name>
              <hosts>
                <locationPatterns>
                  <locationMatch>
                    <location>
                      <protocol>http</protocol>
                      <host>162.55.220.72</host>
                      <port>5005</port>
                      <path>/object_info_1</path>
                      <query>name=Dmitry&amp;age=31&amp;weight=63</query>
                    </location>
                    <enabled>true</enabled>
                  </locationMatch>
                </locationPatterns>
              </hosts>
              <rules>
                <rewriteRule>
                  <active>true</active>
                  <ruleType>7</ruleType>
                  <matchValue>{&quot;age&quot;:31,&quot;daily_food&quot;:0.756,&quot;daily_sleep&quot;:157.5,&quot;name&quot;:&quot;Dmitry&quot;}</matchValue>
                  <matchHeaderRegex>false</matchHeaderRegex>
                  <matchValueRegex>false</matchValueRegex>
                  <matchRequest>false</matchRequest>
                  <matchResponse>true</matchResponse>
                  <newValue>{&quot;age&quot;:31,&quot;daily_food&quot;:65,&quot;daily_sleep&quot;:59,&quot;name&quot;:&quot;NotDmitry&quot;}</newValue>
                  <newHeaderRegex>false</newHeaderRegex>
                  <newValueRegex>false</newValueRegex>
                  <matchWholeValue>false</matchWholeValue>
                  <caseSensitive>false</caseSensitive>
                  <replaceType>2</replaceType>
                </rewriteRule>
              </rules>
</rewriteSet>
...
```

## Ex_4:
`Method: GET
EndPoint: /object_info_3
request url params: 
 name: str
 age: int
 salary: int`

response: 


    {'name': name,
              'age': age,
              'salary': salary,
              'family': {'children': [['Alex', 24], ['Kate', 12]],
                         'pets': {'cat':{'name':'Sunny',
                                         'age': 3},
                                  'dog':{'name':'Luky',
                                         'age': 4}},
                         'u_salary_1_5_year': salary * 4}
              }

**Task:**
Сделать и в Rewrite, и в BreakPoint (можно отключить чтобы не стопило на каждом запросе)
- Сделать через Charles так, чтобы сервер вернул 500 код.
- Сделать через Charles так, чтобы сервер вернул 405 код.
###### breakpoint:
```xml
...
<breakpoint>
              <location>
                <protocol>http</protocol>
                <host>162.55.220.72</host>
                <port>5005</port>
                <path>/object_info_3</path>
                <query>name=Dmitry&amp;age=31&amp;salary=1000</query>
              </location>
              <request>false</request>
              <response>true</response>
              <enabled>false</enabled>
</breakpoint>
...
```
###### rewrite:
```xml
...
<rewriteSet>
              <active>false</active>
              <name>Ex_04</name>
              <hosts>
                <locationPatterns>
                  <locationMatch>
                    <location>
                      <protocol>http</protocol>
                      <host>162.55.220.72</host>
                      <port>5005</port>
                      <path>/object_info_3</path>
                      <query>name=Dmitry&amp;age=31&amp;salary=1000</query>
                    </location>
                    <enabled>true</enabled>
                  </locationMatch>
                </locationPatterns>
              </hosts>
              <rules>
                <rewriteRule>
                  <active>true</active>
                  <ruleType>11</ruleType>
                  <matchValue>200 OK</matchValue>
                  <matchHeaderRegex>false</matchHeaderRegex>
                  <matchValueRegex>false</matchValueRegex>
                  <matchRequest>false</matchRequest>
                  <matchResponse>false</matchResponse>
                  <newValue>500 ERROR</newValue>
                  <newHeaderRegex>false</newHeaderRegex>
                  <newValueRegex>false</newValueRegex>
                  <matchWholeValue>false</matchWholeValue>
                  <caseSensitive>false</caseSensitive>
                  <replaceType>1</replaceType>
                </rewriteRule>
                <rewriteRule>
                  <active>false</active>
                  <ruleType>11</ruleType>
                  <matchValue>200 OK</matchValue>
                  <matchHeaderRegex>false</matchHeaderRegex>
                  <matchValueRegex>false</matchValueRegex>
                  <matchRequest>false</matchRequest>
                  <matchResponse>false</matchResponse>
                  <newValue>405 ERROR</newValue>
                  <newHeaderRegex>false</newHeaderRegex>
                  <newValueRegex>false</newValueRegex>
                  <matchWholeValue>false</matchWholeValue>
                  <caseSensitive>false</caseSensitive>
                  <replaceType>2</replaceType>
                </rewriteRule>
              </rules>
</rewriteSet>
...
```

## Ex_5:
`Method: GET
EndPoint: /object_info_4
request url params: 
 name: str
 age: int
 salary: int`

response: 


    {'name': name,
              'age': int(age),
              'salary': [salary, str(salary * 2), str(salary * 3)]}


Task:
Сделать и в Rewrite, и в BreakPoint (можно отключить чтобы не стопило на каждом запросе)
 ⁃ Сделать через Charles так, чтобы сервер вернул 405 ошибку.
 ⁃ Подменить salary в request
 ⁃ Подменить (salary * 2) в response
###### breakpoint:
```xml
...
<breakpoint>
              <location>
                <protocol>http</protocol>
                <host>162.55.220.72</host>
                <port>5005</port>
                <path>/object_info_4</path>
                <query>name=Dmitry&amp;age=31&amp;salary=1000</query>
              </location>
              <request>false</request>
              <response>true</response>
              <enabled>false</enabled>
</breakpoint>
...
```
###### rewrite:
```xml
...
<rewriteSet>
              <active>false</active>
              <name>Ex_05</name>
              <hosts>
                <locationPatterns>
                  <locationMatch>
                    <location>
                      <protocol>http</protocol>
                      <host>162.55.220.72</host>
                      <port>5005</port>
                      <path>/object_info_4</path>
                      <query>name=Dmitry&amp;age=31&amp;salary=1000</query>
                    </location>
                    <enabled>true</enabled>
                  </locationMatch>
                </locationPatterns>
              </hosts>
              <rules>
                <rewriteRule>
                  <active>true</active>
                  <ruleType>11</ruleType>
                  <matchValue>200 OK</matchValue>
                  <matchHeaderRegex>false</matchHeaderRegex>
                  <matchValueRegex>false</matchValueRegex>
                  <matchRequest>false</matchRequest>
                  <matchResponse>false</matchResponse>
                  <newValue>405 ERROR</newValue>
                  <newHeaderRegex>false</newHeaderRegex>
                  <newValueRegex>false</newValueRegex>
                  <matchWholeValue>false</matchWholeValue>
                  <caseSensitive>false</caseSensitive>
                  <replaceType>2</replaceType>
                </rewriteRule>
                <rewriteRule>
                  <active>true</active>
                  <ruleType>9</ruleType>
                  <matchHeader>salary</matchHeader>
                  <matchValue></matchValue>
                  <matchHeaderRegex>false</matchHeaderRegex>
                  <matchValueRegex>false</matchValueRegex>
                  <matchRequest>false</matchRequest>
                  <matchResponse>false</matchResponse>
                  <newHeader>salary</newHeader>
                  <newValue>1111</newValue>
                  <newHeaderRegex>false</newHeaderRegex>
                  <newValueRegex>false</newValueRegex>
                  <matchWholeValue>false</matchWholeValue>
                  <caseSensitive>false</caseSensitive>
                  <replaceType>1</replaceType>
                </rewriteRule>
                <rewriteRule>
                  <active>true</active>
                  <ruleType>9</ruleType>
                  <matchHeader>salary</matchHeader>
                  <matchValue>1000</matchValue>
                  <matchHeaderRegex>false</matchHeaderRegex>
                  <matchValueRegex>false</matchValueRegex>
                  <matchRequest>false</matchRequest>
                  <matchResponse>false</matchResponse>
                  <newHeader>salary</newHeader>
                  <newValue>2000</newValue>
                  <newHeaderRegex>false</newHeaderRegex>
                  <newValueRegex>false</newValueRegex>
                  <matchWholeValue>false</matchWholeValue>
                  <caseSensitive>false</caseSensitive>
                  <replaceType>2</replaceType>
                </rewriteRule>
              </rules>
</rewriteSet>
...
```

## Ex_6:
`Method: POST
EndPoint: /user_info_2
request form data: 
 name: str
 age: int
 salary: int`

response: 


    {'start_qa_salary': salary,
              'qa_salary_after_6_months': salary * 2,
              'qa_salary_after_12_months': salary * 2.7,
              'qa_salary_after_1.5_year': salary * 3.3,
              'qa_salary_after_3.5_years': salary * 3.8,
              'person': {'u_name': [user_name, salary, age],
                         'u_age': age,
                         'u_salary_5_years': salary * 4.2}
              }

**Task:**
Сделать и в Rewrite, и в BreakPoint (можно отключить чтобы не стопило на каждом запросе)
 ⁃ Сделать через Charles так, чтобы в Postman вернулся ответ, в котором qa_salary_after_1.5_year переименовано в qa_salary_after_1.5_month
 ⁃ Сделать так чтобы qa_salary_after_3.5_years было меньше qa_salary_after_12_months в response
###### breakpoint:
```xml
...
<breakpoint>
              <location>
                <protocol>http</protocol>
                <host>162.55.220.72</host>
                <port>5005</port>
                <path>/user_info_2</path>
              </location>
              <request>false</request>
              <response>true</response>
              <enabled>false</enabled>
</breakpoint>
...
```
###### rewrite:
```xml
...
<rewriteSet>
              <active>true</active>
              <name>Ex_06</name>
              <hosts>
                <locationPatterns>
                  <locationMatch>
                    <location>
                      <protocol>http</protocol>
                      <host>162.55.220.72</host>
                      <port>5005</port>
                      <path>/user_info_2</path>
                    </location>
                    <enabled>true</enabled>
                  </locationMatch>
                </locationPatterns>
              </hosts>
              <rules>
                <rewriteRule>
                  <active>true</active>
                  <ruleType>7</ruleType>
                  <matchValue>qa_salary_after_1.5_year</matchValue>
                  <matchHeaderRegex>false</matchHeaderRegex>
                  <matchValueRegex>false</matchValueRegex>
                  <matchRequest>false</matchRequest>
                  <matchResponse>true</matchResponse>
                  <newValue>qa_salary_after_1.5_month</newValue>
                  <newHeaderRegex>false</newHeaderRegex>
                  <newValueRegex>false</newValueRegex>
                  <matchWholeValue>false</matchWholeValue>
                  <caseSensitive>false</caseSensitive>
                  <replaceType>2</replaceType>
                </rewriteRule>
                <rewriteRule>
                  <active>true</active>
                  <ruleType>7</ruleType>
                  <matchValue>3800.0</matchValue>
                  <matchHeaderRegex>false</matchHeaderRegex>
                  <matchValueRegex>false</matchValueRegex>
                  <matchRequest>false</matchRequest>
                  <matchResponse>true</matchResponse>
                  <newValue>1111</newValue>
                  <newHeaderRegex>false</newHeaderRegex>
                  <newValueRegex>false</newValueRegex>
                  <matchWholeValue>false</matchWholeValue>
                  <caseSensitive>false</caseSensitive>
                  <replaceType>2</replaceType>
                </rewriteRule>
              </rules>
</rewriteSet>
...
```