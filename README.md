# Тестовое задание 

## Подготовка и проверки

Нужны Python 3, Docker и Make. Выполняйте команды из корня проекта:

```bash
make up
make setup
make test
```

Для очистки второстепенных файлов/папок (кроме .venv и data для oracle-db):

```bash
make clean
```

## Подключение к базе

Для подключения с компьютера, на котором запущен Docker:

| Поле | Значение |
| --- | --- |
| Host | `localhost` |
| Port | Значение `ORACLE_PORT` из `.env` |
| Service Name | `XEPDB1` |
| User | `PDBADMIN` |
| Password | Значение `ORACLE_PWD` из `.env` |

Строка подключения:

```text
localhost:1521/XEPDB1
```
