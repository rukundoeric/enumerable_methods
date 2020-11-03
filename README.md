![](https://img.shields.io/badge/Microverse-blueviolet)

# Enumerable
> Enumerable is a collection of iteration method, a Ruby module and a great part of what makes ruby a great programming language. In this project, we try to customize some of the Ruby enumerable functions.

## Setup Instruction
* Clone this Repo
* Navigate to project Directory
* Now, to test each function go to the end of the page and do the following.

- For my_each 
 ```ruby
[1, 2, 3, 5].my_each { |x| p x }
```
- Output
 ```bash
=> 1
=> 2
=> 3
=> 5
```

- For my_each_with_index
```ruby
[1, 2, 3, 5].my_each_with_index { |x, y| puts "#{x} at #{y}" }
```
- Output

 ```bash
=> 1 at 0
=> 2 at 1
=> 3 at 2
=> 5 at 3
```
- For my_select
```ruby
[1, 2, 3, 4].my_select { |x| x % 2 == 0}
```
- Output

 ```bash
=> [2, 4]
```
- For my_all
```ruby
['alpha', 'apple', 'allen key'].my_all?{ |x| x[0] == 'a' }
```
- Output

 ```bash
=> true
```
- For my_any
```ruby
['alpha', 'apple', 'allen key'].my_any?{ |x| x[-1] == 'y' }
```
- Output

 ```bash
=> true
```
- For my_none
```ruby
['Alpha', 'Apple', 'Allen key'].my_none?{ |x| x[0] == 'z' }
```
- Output

 ```bash
=> true
```
- For my_count
```ruby
arr = [1, 2, 3, 4]
arr.my_count { |i| i%2==0}
```
- Output

 ```bash
=> 2
```
- For my_map
```ruby
[1,2,3,4,4,7,7,7,9].my_map { |i| i*4 }
```
- Output

 ```bash
=> [4, 8, 12, 16, 16, 28, 28, 28, 36]
```
- For my_inject
```ruby
[1,2,3,4,4,7,7,7,9].my_inject(0){|running_total, item| running_total + item }
```
- Output

 ```bash
=> 44
```

## Live Demo
[Live Demo Link](https://repl.it/@sinansevgi/enummethods#test.rb)

## Built With

- Ruby

## Authors

👤 **Rukundo Eric**

- GitHub: [@rukundoeric](https://github.com/rukundoeric)
- Twitter: [@rukundoeric005](https://twitter.com/rukundoeric005)
- LinkedIn: [Rukundo Eric](https://www.linkedin.com/in/rukundo-eric-000bba181/)

👤 **Sinan Sevgi**

- GitHub: [@sinansevgi](https://github.com/sinansevgi)
- LinkedIn: [@sinansevgi](https://www.linkedin.com/in/sinan-s-52559437/)
- Twitter: [@nativeofcybers1](https://twitter.com/nativeofcybers1)



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- We would like to thank our code reviewer and anyone else who participated in making this done.

## 📝 License

This project is [MIT](./LICENSE) licensed.
