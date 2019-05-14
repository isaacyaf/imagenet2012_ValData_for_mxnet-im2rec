#!/bin/bash
for x in ./*.tar; do
  mkdir "${x%.*}"
  mv "$x" "${x%.*}"
  cd "${x%.*}"
  tar -xvf "$x"
  rm "$x"
  cd ..
done

