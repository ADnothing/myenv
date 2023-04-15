#!/usr/bin/env bash

if [ $1 == main ]; then
  touch main.py
  echo '#!/usr/bin/env python' >> main.py
  echo "" >> main.py
  echo "#USER, date" >> main.py
  echo "#main.py" >> main.py
  echo "#main python file" >> main.py
  echo "" >> main.py
  echo "" >> main.py

else
  touch "$1".py
  echo '#!/usr/bin/env python' >> "$1".py
  echo "" >> "$1".py
  echo "#USER, date" >> "$1".py
  echo "#File.py" >> "$1".py
  echo "" >> "$1".py
  echo "import numpy as np" >> "$1".py
  echo "import matplotlib.pyplot as plt" >> "$1".py
  echo "" >> "$1".py
  echo "" >> "$1".py
  
fi

exit 0
