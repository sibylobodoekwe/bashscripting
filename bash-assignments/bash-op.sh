# bash operators
#!/bin/bash

file="/bashscripting/test.sh"
var="test.sh"
string1="Hello"
string2="World"
int1=10
int2=20

# Test file existence
if [[ -a "${file}" ]]; then
  echo "File exists"
fi

if [[ -e "${file}" ]]; then
  echo "File exists"
fi

# Test file type
if [[ -b "${file}" ]]; then
  echo "Block special file"
fi

if [[ -c "${file}" ]]; then
  echo "Character special file"
fi

if [[ -d "${file}" ]]; then
  echo "Directory"
fi

if [[ -f "${file}" ]]; then
  echo "Regular file"
fi

if [[ -h "${file}" || -L "${file}" ]]; then
  echo "Symbolic link"
fi

if [[ -w "${file}" ]]; then
  echo "Writable"
fi

# String Expressions

if [[ -z "${string1}" ]]; then
  echo "String is empty"
fi

if [[ -n "${string1}" ]]; then
  echo "String is not empty"
fi

if [[ "${string1}" == "${string2}" ]]; then
  echo "Strings are equal"
fi

if [[ "${string1}" != "${string2}" ]]; then
  echo "Strings are not equal"
fi

if [[ "${string1}" < "${string2}" ]]; then
  echo "String1 sorts before String2"
fi

if [[ "${string1}" > "${string2}" ]]; then
  echo "String1 sorts after String2"
fi

# Arithmetic Expressions
if [[ "${int1}" -eq "${int2}" ]]; then
  echo "Integers are equal"
fi

if [[ "${int1}" -ne "${int2}" ]]; then
  echo "Integers are not equal"
fi

if [[ "${int1}" -lt "${int2}" ]]; then
  echo "Int1 is less than Int2"
fi

if [[ "${int1}" -le "${int2}" ]]; then
  echo "Int1 is less than or equal to Int2"
fi

if [[ "${int1}" -gt "${int2}" ]]; then
  echo "Int1 is greater than Int2"
fi

if [[ "${int1}" -ge "${int2}" ]]; then
  echo "Int1 is greater than or equal to Int2"
fi

# Logical Operators
if [[ -e "${file}" && -w "${file}" ]]; then
  echo "File exists and is writable"
fi

if [[ -d "${file}" || "${string1}" == "${string2}" ]]; then
  echo "File is a directory or strings are equal"
fi
