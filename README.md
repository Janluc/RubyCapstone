# Ruby Capstone: Code Linter
> A Ruby program with the purpose of linting code files. Uses object oriented programming to abstract methods and provide readability. This linter can check for Trailing whitespace, missing end brackets, and incorrect indentation


## Built With

- Ruby,
- Visual Studio Code, Git and Github.


Trailing whitespace detection
=============================
### Incorrect code
```ruby
 class Player 
  attr_accessor :name, :token

  def initialize(name, token)
    self.name = name
    self.token = token
  end
end

```
### Correct Code
```ruby
 class Player
  attr_accessor :name, :token

  def initialize(name, token)
    self.name = name
    self.token = token
  end
end

```
- Although a bit hard to see through a code block, this linter will let you know if there is a trailing whitespace at the end of any of your lines (highlight in front of "Class Player")


Missing Ending Brackets
=======================
### Incorrect code
```ruby
 class Player
  attr_accessor :name, :token

  def initialize(name, token
    self.name = name
    self.token = token
  end
end

```
### Correct Code
```ruby
 class Player
  attr_accessor :name, :token

  def initialize(name, token)
    self.name = name
    self.token = token
  end
end

```
- This linter will let you know if you are missing a closing bracket in any of your lines. A closing bracket can be either a parenthesis, squiggly brackets, square brackets, etc.


Incorrect Indentation
=====================
### Incorrect code
```ruby
 class Player
 attr_accessor :name, :token

  def initialize(name, token
  self.name = name
  self.token = token
  end
end

```
### Correct Code
```ruby
 class Player
  attr_accessor :name, :token

  def initialize(name, token)
    self.name = name
    self.token = token
  end
end

```
- This linter will let you know if your indentation is incorrect.
## Pre-requisites
- The most up to date version of Ruby
- a Command Line/Terminal

## Installation
- First download or clone the project
- With your terminal go to the bin folder in the directory where you have downloaded/cloned the repo
- in your terminal type "ruby main.rb" without the quotes

## Instructions
- When you run the program, You will be asked to place the file you would like to lint to the "to_lint" folder.
- Please place the code file inside that folder now
- Type in the name of the file exactly how you see it (including the file extension)
- If done correctly, you will see your the results of the linter shortly!


## Authors

👤 **Janluc Saneaux**

- Github: [@Janluc](https://github.com/Janluc)   
- Twitter: [@Janluc123](https://twitter.com/Janluc123)
- Linkedin: [linkedin](https://www.linkedin.com/in/janluc-saneaux-91707a1b4/) 


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!
