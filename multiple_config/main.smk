rule all:
  input:
    "x"

print(config)

rule a:
  output:
    touch("x")
