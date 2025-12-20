# Настройка документации ReadTheDocs

Этот проект использует интеграцию Doxygen и Sphinx для автоматической генерации документации C++ API на ReadTheDocs.

## Структура

- `Doxyfile` - конфигурация Doxygen для генерации XML из C++ кода
- `.readthedocs.yml` - конфигурация ReadTheDocs для автоматической сборки
- `docs/source/conf.py` - конфигурация Sphinx с расширением Breathe
- `docs/source/api/cpp_api.rst` - страница с C++ API документацией

## Процесс сборки

1. **Doxygen** генерирует XML документацию из C++ исходников в `build/xml/`
2. **Breathe** (расширение Sphinx) читает XML и встраивает в Sphinx документацию
3. **Sphinx** генерирует финальную HTML документацию

## Локальная сборка

Для локальной проверки документации:

```bash
# Установка зависимостей
pip install -r requirements.txt

# Установка Doxygen (Windows)
# Скачать с https://www.doxygen.nl/download.html

# Генерация XML
doxygen Doxyfile

# Сборка Sphinx документации
cd docs
sphinx-build -b html source _build/html
```

## Настройка на ReadTheDocs

1. Импортируйте репозиторий на https://readthedocs.org/
2. ReadTheDocs автоматически обнаружит `.readthedocs.yml`
3. При каждой сборке:
   - Устанавливаются зависимости из `requirements.txt`
   - Устанавливается Doxygen
   - Генерируется XML из C++ кода
   - Собирается Sphinx документация с интеграцией Breathe

## Добавление C++ документации

Добавьте комментарии Doxygen в ваш C++ код:

```cpp
/**
 * @brief Краткое описание класса
 * 
 * Подробное описание функциональности класса.
 */
class MyClass {
public:
    /**
     * @brief Конструктор
     * @param value начальное значение
     */
    MyClass(int value);
};
```

Затем в `docs/source/api/cpp_api.rst` используйте директивы Breathe:

```rst
.. doxygenclass:: MyClass
   :project: Espardu-IoT
   :members:
```




