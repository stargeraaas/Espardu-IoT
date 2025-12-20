C++ API Документация
====================

Эта документация автоматически сгенерирована из C++ кода с помощью Doxygen и встроена в Sphinx через Breathe.

.. note::

   Перед сборкой документации убедитесь, что Doxygen сгенерировал XML файлы:
   
   .. code-block:: bash
      
      doxygen Doxyfile

Wireless
--------

Модуль беспроводной связи с поддержкой Wi-Fi и BLE.

.. doxygenindex::
   :project: Espardu-IoT

Для получения подробной информации об отдельных компонентах, используйте директивы:

.. code-block:: rst

   .. doxygenclass:: ClassName
      :project: Espardu-IoT
      :members:
      :protected-members:
      :private-members:
      :undoc-members:

   .. doxygenfunction:: functionName
      :project: Espardu-IoT

   .. doxygenstruct:: StructName
      :project: Espardu-IoT
      :members:

.. tip::

   После добавления C++ кода с комментариями Doxygen, XML будет автоматически 
   сгенерирован и встроен в эту документацию при следующей сборке.





