- name: Setup Ruby
        uses: ruby/setup-ruby@0a29871fe2b0200a17a4497bae54fe5df0d973aa # v1.115.3
        with:
          ruby-version: '3.0' # Not needed with a .ruby-version file
          bundler-cache: true # runs 'bundle install' and caches installed gems automatically
          cache-version: 0 # Increment this number if you need to re-download cached gems
      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v2
      - name: Build with Jekyll
        # Outputs to the './_site' directory by default
        run: bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"
        env:
          JEKYLL_ENV: production

      - name: add header links h2
        run: sed -iE "s/\<h2 id=\"\(.*\)\"\>\(.*\)\<\/h2\>/\<h2 id=\"\1\"\>\<a href=\"#\1\"\>\2\<\/a\>\<\/h2\>/g" ./_site/wiki/*.html ./_site/*.html ./wiki/*.html ./*.html
        shell: bash
        env:
          JEKYLL_ENV: production

      - name: add header links h3
        run: sed -iE "s/\<h3 id=\"\(.*\)\"\>\(.*\)\<\/h3\>/\<h3 id=\"\1\"\>\<a href=\"#\1\"\>\2\<\/a\>\<\/h3\>/g" ./_site/wiki/*.html ./_site/*.html ./wiki/*.html ./*.html 
        shell: bash
        env:
          JEKYLL_ENV: production
