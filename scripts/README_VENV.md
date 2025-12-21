# Использование виртуального окружения

Проект использует Python virtual environment (venv) для изоляции зависимостей.

## Быстрый старт

### Создание виртуального окружения

**Windows:**
```batch
setup_venv.bat
```

**Linux/macOS:**
```bash
chmod +x setup_venv.sh
./setup_venv.sh
```

## Использование pip и python

В проекте доступны обертки для автоматического использования venv. Есть два способа использования:

### Способ 1: Обертки (рекомендуется)

Вместо стандартных команд используйте обертки из корня проекта:

### Windows

Вместо стандартных команд используйте обертки:

```batch
# Использование pip
pip.bat install package_name
pip.bat list
pip.bat freeze

# Использование python
python.bat script.py
python.bat -m module_name
```

### Linux/macOS

```bash
# Сделать скрипты исполняемыми (один раз)
chmod +x pip.sh python.sh

# Использование pip
./pip.sh install package_name
./pip.sh list
./pip.sh freeze

# Использование python
./python.sh script.py
./python.sh -m module_name
```

## Ручная активация venv

Если предпочитаете активировать venv вручную:

**Windows:**
```batch
venv\Scripts\activate.bat
pip install package_name
python script.py
deactivate
```

**Linux/macOS:**
```bash
source venv/bin/activate
pip install package_name
python script.py
deactivate
```

## Обновление зависимостей

После изменения `requirements.txt`:

**Windows:**
```batch
pip.bat install -r requirements.txt --upgrade
```

**Linux/macOS:**
```bash
./pip.sh install -r requirements.txt --upgrade
```

## Примечания

- Обертки автоматически проверяют наличие venv и выводят понятное сообщение об ошибке, если venv не найден
- Обертки работают из любой директории проекта
- Если venv не найден, `python.bat`/`python.sh` используют системный Python как fallback
- Все зависимости проекта перечислены в `requirements.txt`

