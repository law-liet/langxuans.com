# langxuans.com

My Personal Website

# Run

1. Setup [Stack](http://haskellstack.org) and [Elm](http://elm-lang.org) platform.
3. Compile Elm files
  
  ```
  elm make static/*.elm --output=static/main.js
  ```

4. Build with Stack

  ```
  stack build
  ```

5. Execute with Stack

  ```
  stack exec lawliet
  ```