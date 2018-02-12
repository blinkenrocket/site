from distutils.dir_util import copy_tree
import jinja2
import lesscpy

project_info = {
    'manual_link': 'https://github.com/blinkenrocket/documentation/raw/master/manual/manual.pdf',
    'editor_link': 'webedit-react/',
    'tutorial_link': 'http://www.instructables.com/id/BLINKENROCKET/',
    'shop_link': 'https://hackerspaceshop.com/products/blinkenrocket',
    'email': 'info@blinkenrocket.de',
}

def build_html_file(env, name, **args):
    template = env.get_template(name)

    path = 'build/%s' % name
    print('writing %s....' % path)
    with open(path, 'w') as target:
        output = template.render(**args)
        target.write(output.encode('utf-8'))

def build_html():
    env = jinja2.Environment(loader=jinja2.FileSystemLoader('.'))
    env.globals.update(project_info)

    with open('images/blinkenrocket.svg', 'r') as logo_file:
        env.globals['logo'] = logo_file.read()

    copy_tree('images', 'build/images')

    build_html_file(env, 'index.html')
    build_html_file(env, 'index.en.html')
    build_html_file(env, 'sponsors.html')
    build_html_file(env, 'legal.html')



def build_css():
    with open('css/style.less', 'r') as less:
        path = 'build/style.css'
        print('writing %s....' % path)
        with open(path, 'w') as css:
            css.write(lesscpy.compile(less, minify=True))

def build():
    build_html()
    build_css()

if __name__ == '__main__':
    build()
