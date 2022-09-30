cat main.css wiki.css > main-wiki.css
cat main.css post.css > main-post.css
cat main.css blog.css > main-blog.css

cleancss -o main-min.css main.css
cleancss -o wiki-min.css main-wiki.css
cleancss -o post-min.css main-post.css
cleancss -o blog-min.css main-blog.css
cleancss -o non-critical-post-min.css non-critical-post.css
