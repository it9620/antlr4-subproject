# antlr4-subproject

This is common docker runner to use ANTLR4 generation.

Just specify your grammar in `Syntax.g4` file and then run commands:

```sh
# To build an image:
docker build -t antlr4-generator . 
# To run a container:
docker run -it --rm -v ./generated:/root/generated antlr4-generator
```

All generated files will be written into `./generated` directory on your machine.
To use generated files in your code, you need include corespoding to your language library. For C# you can use just `Nuget` to include a library for ANTLR4.

## Debuging

For debuging you can change Entry point in dockerfile to bash, rebuild an image and then run container.

Inside container run command like `java -jar /usr/local/lib/antlr-4.13.2-complete.jar -o ./generated -listener -visitor -Dlanguage=CSharp /root/Syntax.g4`
and see the output and do your manipulation.

---

## About ANTLR4

**ANTLR4** (ANother Tool for Language Recognition) is a powerful parser generator used for reading, processing, translating, or executing structured text or binary files. It's widely used for building compilers, interpreters, and translators for domain-specific languages.

If you're looking to **use ANTLR4**, here's a brief guide to get you started:

1. **Install ANTLR4**:
   - **Java Runtime Environment**: ANTLR4 is written in Java, so you'll need to have Java installed.
   - **Download ANTLR4 Tool**: Get the ANTLR4 tool (antlr-4.X-complete.jar) from the [official website](https://www.antlr.org/download.html).

2. **Define Your Grammar**:
   - Create a `.g4` file that describes the grammar of the language you want to parse.
   - The grammar includes lexer rules (tokens) and parser rules (how tokens are combined).

   ```antlr
   grammar Hello;

   r  : 'hello' ID ;
   ID : [a-zA-Z]+ ;
   WS : [ \t\r\n]+ -> skip ;
   ```

3. **Generate Parser and Lexer**:
   - Use the ANTLR4 tool to generate code in your target language (Java, Python, C#, etc.).

     ```bash
     java -jar antlr-4.X-complete.jar -Dlanguage=Python3 Hello.g4
     ```

4. **Integrate into Your Project**:
   - Include the generated files in your project.
   - Add the ANTLR runtime library for your target language.

5. **Write the Driver Code**:
   - Use the generated lexer and parser in your code to parse input texts.

   ```python
   import sys
   from antlr4 import *
   from HelloLexer import HelloLexer
   from HelloParser import HelloParser

   def main():
       lexer = HelloLexer(StdinStream())
       stream = CommonTokenStream(lexer)
       parser = HelloParser(stream)
       tree = parser.r()
       print(tree.toStringTree(recog=parser))

   if __name__ == '__main__':
       main()
   ```

6. **Run Your Parser**:
   - Execute your program and provide input to parse.

     ```bash
     python3 your_script.py
     ```

     **Input**:

     ```
     hello world
     ```

7. **Explore and Extend**:
   - Modify the grammar to suit your needs.
   - Implement listeners or visitors to walk the parse tree and perform actions.

**Additional Resources**:

- **Official Documentation**: [ANTLR4 Documentation](https://github.com/antlr/antlr4/blob/master/doc/index.md)
- **Book**: *The Definitive ANTLR 4 Reference* by Terence Parr
- **Tutorials**:
  - [ANTLR Mega Tutorial](https://tomassetti.me/antlr-mega-tutorial/)
  - [Using ANTLR for Processing Structured Text](https://www.baeldung.com/java-antlr)

---
