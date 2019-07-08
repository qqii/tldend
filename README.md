# tldend

Check if a word ends with a any tld

`nix-shell`  
`echo <domain name idea> | tldend`

`curl --silent https://en.wikipedia.org/wiki/Glossary_of_category_theory?action=raw | grep -oP '(?<=^{{term\|1=).*(?=}})' | tldend`