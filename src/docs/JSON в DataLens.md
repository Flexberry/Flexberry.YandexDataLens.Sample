# JSON в DataLens

В DataLens не предусмотрено специального типа данных для работы с JSON ([см. доступные типы данных](https://datalens.tech/docs/ru/concepts/data-types.html)).

Для получения JSON-данных необходимо, чтобы они были представлены в строковом формате в подключаемой БД. Если они представлены внутри БД в специфичном JSON-типе, то нужно будет их преобразовать в строковое представление в самой БД, например, через дополнительное вычисляемое поле.

В дальнейшем можно будет получить значения ключей из JSON с помощью доступных в DataLens [строковых функций](https://datalens.tech/docs/ru/function-ref/string-functions.html) и [функций преобразования типов](https://datalens.tech/docs/ru/function-ref/type-conversion-functions.html) создав в датасете вычисляемое поле.

## Пример
Пусть JSON-данные следующего вида: 
```
[{"$id":"1","field":"Name","mainChange":null,"newValue":"Brand 783759524","oldValue":"-NULL-"}]
```

Тогда для получения значений `newValue` в датасете можно создать вычисляемое поле со следующей формулой:

```
STR(
    REPLACE(
        LEFT(
            SUBSTR(
                SUBSTR([SerializedFields],FIND([SerializedFields],"newValue")),
                FIND(
                    SUBSTR([SerializedFields],FIND([SerializedFields],"newValue")),
                    ":"
                ) + 1
            ),
            FIND(
                SUBSTR(
                    SUBSTR([SerializedFields],FIND([SerializedFields],"newValue")),
                    FIND(
                        SUBSTR([SerializedFields],FIND([SerializedFields],"newValue")),
                        ":"
                    ) + 1
                ),
                ","  
            ) - 1 
        ),
        "\"", 
        ""
    )
)
```

В данном примере внутри подключаемой БД в поле `SerializedFields` JSON-данные представлены в строковом формате. Вычисляемое поле тоже представляет собой строку, но можно изменить тип вычисляемого поля, заменив `STR` на нужную [функцию преобразования типов](https://datalens.tech/docs/ru/function-ref/type-conversion-functions.html). Функция `STR` - не является обязательной, она представлена для более шаблонного представления формулы вычисляемого поля.