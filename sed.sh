      - name: add header links h2
        run: sed -iE "s/\<h2 id=\"\(.*\)\"\>\(.*\)\<\/h2\>/\<h2 id=\"\1\"\>\<a href=\"#\1\"\>\2\<\/a\>\<\/h2\>/g" _site/wiki/*.html _site/*.html
        env:
          JEKYLL_ENV: production

      - name: add header links h2
        run: sed -iE "s/\<h3 id=\"\(.*\)\"\>\(.*\)\<\/h3\>/\<h3 id=\"\1\"\>\<a href=\"#\1\"\>\2\<\/a\>\<\/h3\>/g" _site/wiki/*.html _site/*.html
        env:
          JEKYLL_ENV: production
