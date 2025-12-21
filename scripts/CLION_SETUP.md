# Настройка CLion для работы с PlatformIO

Этот проект использует PlatformIO для разработки на ESP32. Ниже описана настройка CLion для работы с проектом.

## Предварительные требования

1. **Python 3.8+** с установленным `venv`
2. **PlatformIO Core** - установится автоматически при создании venv из `requirements.txt`

## Установка виртуального окружения

### Windows
```batch
setup_venv.bat
```

### Linux/macOS
```bash
chmod +x setup_venv.sh
./setup_venv.sh
```

Это создаст виртуальное окружение `venv/` и установит все зависимости, включая PlatformIO Core.

## Настройка CLion

### Вариант 1: Использование плагина PlatformIO для CLion

1. Установите плагин **PlatformIO** в CLion:
   - `File` → `Settings` (или `Preferences` на macOS)
   - `Plugins` → Найдите "PlatformIO" → Установите и перезапустите CLion

2. Откройте проект PlatformIO:
   - `File` → `Open` → Выберите папку `sandbox/ESP-32`
   - CLion автоматически определит PlatformIO проект

3. Выберите окружение (environment):
   - В правом верхнем углу выберите `adafruit_feather_esp32s2` или `ATmega328PB`

### Вариант 2: Интеграция через CMake (если доступен)

Если ваш PlatformIO проект имеет поддержку CMake:

1. Откройте проект через CMake:
   - `File` → `Settings` → `Build, Execution, Deployment` → `CMake`
   - Укажите директорию сборки: `sandbox/ESP-32`

2. Настройте toolchain для PlatformIO:
   - PlatformIO будет использовать свой собственный toolchain
   - Убедитесь, что PlatformIO Core установлен и доступен через venv

### Использование PlatformIO из venv

Если PlatformIO установлен в venv, CLion может использовать его:

1. Активируйте venv перед запуском CLion (опционально):
   ```bash
   # Windows
   venv\Scripts\activate.bat

   # Linux/macOS
   source venv/bin/activate
   ```

2. Или укажите путь к PlatformIO в настройках CLion:
   - PlatformIO обычно устанавливается в: `venv/Scripts/platformio.exe` (Windows) или `venv/bin/pio` (Linux/macOS)

## Команды PlatformIO

После настройки вы можете использовать команды PlatformIO через терминал CLion:

```bash
# Сборка проекта
pio run

# Загрузка на устройство
pio run --target upload

# Мониторинг последовательного порта
pio device monitor

# Очистка проекта
pio run --target clean
```

## Структура проекта

- `sandbox/ESP-32/` - основной PlatformIO проект
- `sandbox/ESP-32/src/` - исходный код
- `sandbox/ESP-32/include/` - заголовочные файлы
- `sandbox/ESP-32/lib/` - локальные библиотеки
- `platformio.ini` - конфигурация PlatformIO

## Примечания

- CLion может не полностью поддерживать все функции PlatformIO через CMake
- Для полной поддержки рекомендуется использовать плагин PlatformIO для CLion
- Альтернативно можно использовать PlatformIO IDE (на базе VSCode) или PlatformIO CLI


