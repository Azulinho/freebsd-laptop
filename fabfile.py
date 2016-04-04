import cuisine
import fabric
import re
from fabric.context_managers import settings, hide
from bookshelf.api_v2.git import git_clone

cuisine.mode_local()
fabric.api.env.hosts = ['127.0.0.1']
fabric.api.env.shell = '/usr/local/bin/bash -c'



def _ensure_local_line(filename, line):
  contents = fabric.api.local('cat %s' % filename, capture=True)
  if not line in contents:
    fabric.api.local('echo %s | sudo tee -a %s' % (line, filename))


def _is_installed(pkg):
  with settings(hide('everything'), warn_only=True):
    item = pkg.split('/')[1]
    return cuisine.sudo('pkg info %s >/dev/null 2>&1' % item).return_code == 0


def _ensure_package(pkg):
    if not _is_installed(pkg):
       print('installing %s ...' % pkg)
       cuisine.sudo('portmaster -mBATCH=yes -dBG --no-confirm --delete-packages --update-if-newer -y %s' % pkg)


def _packages():
  return [
    'sysutils/vagrant',
    'emulators/virtualbox-ose',
    'sysutils/tmux',
    'net-mgmt/wifimgr',
    'sysutils/docker-freebsd',
    'devel/py27-virtualenv',
    'devel/py27-pip',
    'www/chromium',
    'x11-fonts/powerline-fonts',
    'converters/dosunix'
  ]


def setup():
  cuisine.group_ensure('wheel')
  cuisine.user_ensure('azul')
  cuisine.group_user_ensure('wheel', 'azul')

  for item in _packages():
    _ensure_package(item)

  _zerotier()
  _virtualbox()
  _vim()
  _x11_themes()


def _zerotier():
  _ensure_package('net/zerotier')
  _ensure_local_line('/etc/rc.conf', 'zerotier_enable="YES"')


def _virtualbox():
  _ensure_package('emulators/virtualbox-ose')
  _ensure_local_line('/etc/rc.conf', 'vboxnet_enable="YES"')
  _ensure_local_line('/boot/loader.conf', 'vboxdrv_load="YES"')


def _vim():
  _ensure_package('editors/vim')
  _ensure_package('devel/py-jedi')
  _ensure_local_line('/home/azul/.profile', 'alias vi=vim')
  _ensure_local_line('/boot/loader.conf', 'vboxdrv_load="YES"')

  vim_bundle_urls = [
    'https://github.com/gmarik/vundle.git',
    'https://github.com/zaiste/Atom.git',
    'https://github.com/fisadev/FixedTaskList.vim.git',
    'https://github.com/vim-scripts/IndexedSearch.git',
    'https://github.com/vim-scripts/Reindent.git',
    'https://github.com/wesleyche/SrcExpl.git',
    'https://github.com/vim-scripts/Wombat.git',
    'https://github.com/vim-scripts/YankRing.vim.git',
    'https://github.com/rking/ag.vim.git',
    'https://github.com/sjl/badwolf.git',
    'https://github.com/chriskempson/base16-vim.git',
    'https://github.com/vim-scripts/c.vim.git',
    'https://github.com/lilydjwg/colorizer.git',
    'https://github.com/rosenfeld/conque-term.git',
    'https://github.com/kien/ctrlp.vim.git',
    'https://github.com/fisadev/dragvisuals.vim.git',
    'https://github.com/troydm/easybuffer.vim.git',
    'https://github.com/editorconfig/editorconfig-vim.git',
    'https://github.com/mattn/emmet-vim.git',
    'https://github.com/fisadev/fisa-vim-colorscheme.git',
    'https://github.com/motemen/git-vim.git',
    'https://github.com/gregsexton/gitv.git',
    'https://github.com/matthias-guenther/hammer.vim.git',
    'https://github.com/lukerandall/haskellmode-vim.git',
    'https://github.com/Yggdroot/indentLine.git',
    'https://github.com/alfredodeza/jacinto.vim.git',
    'https://github.com/davidhalter/jedi-vim.git',
    'https://github.com/tomasr/molokai.git',
    'https://github.com/juvenn/mustache.vim.git',
    'https://github.com/Shougo/neocomplcache.vim.git',
    'https://github.com/Shougo/neocomplete.vim.git',
    'https://github.com/Shougo/neosnippet.git',
    'https://github.com/shougo/neosnippet-snippets.git',
    'https://github.com/scrooloose/nerdcommenter.git',
    'https://github.com/scrooloose/nerdtree.git',
    'https://github.com/joshdick/onedark.vim.git',
    'https://github.com/klen/python-mode.git',
    'https://github.com/vim-scripts/python.vim.git',
    'https://github.com/vim-scripts/python_match.vim.git',
    'https://github.com/vim-scripts/pythoncomplete.git',
    'https://github.com/kien/rainbow_parentheses.vim.git',
    'https://github.com/python-rope/ropevim.git',
    'https://github.com/vim-scripts/scratch.vim.git',
    'https://github.com/epeli/slimux.git',
    'https://github.com/sjl/splice.vim.git',
    'https://github.com/scrooloose/syntastic.git',
    'https://github.com/kien/tabman.vim.git',
    'https://github.com/majutsushi/tagbar.git',
    'https://github.com/tomtom/tlib_vim.git',
    'https://github.com/zaiste/tmux.vim.git',
    'https://github.com/MarcWeber/vim-addon-mw-utils.git',
    'https://github.com/bling/vim-airline.git',
    'https://github.com/vim-airline/vim-airline-themes.git',
    'https://github.com/tsaleh/vim-align.git',
    'https://github.com/gosukiwi/vim-atom-dark.git',
    'https://github.com/Townk/vim-autoclose.git',
    'https://github.com/t9md/vim-choosewin.git',
    'https://github.com/LucHermitte/vim-clang.git',
    'https://github.com/tpope/vim-classpath.git',
    'https://github.com/guns/vim-clojure-static.git',
    'https://github.com/kchmck/vim-coffee-script.git',
    'https://github.com/altercation/vim-colors-solarized.git',
    'https://github.com/Elive/vim-colorscheme-elive.git',
    'https://github.com/flazz/vim-colorschemes.git',
    'https://github.com/fisadev/vim-ctrlp-cmdpalette.git',
    'https://github.com/easymotion/vim-easymotion.git',
    'https://github.com/elixir-lang/vim-elixir.git',
    'https://github.com/tpope/vim-endwise.git',
    'https://github.com/tpope/vim-eunuch.git',
    'https://github.com/tpope/vim-fireplace.git',
    'https://github.com/tpope/vim-fugitive.git',
    'https://github.com/tpope/vim-haml.git',
    'https://github.com/w0ng/vim-hybrid.git',
    'https://github.com/michaeljsmith/vim-indent-object.git',
    'https://github.com/fisadev/vim-isort.git',
    'https://github.com/digitaltoad/vim-jade.git',
    'https://github.com/zeis/vim-kolor.git',
    'https://github.com/lunaru/vim-less.git',
    'https://github.com/tpope/vim-markdown.git',
    'https://github.com/Spaceghost/vim-matchit.git',
    'https://github.com/terryma/vim-multiple-cursors.git',
    'https://github.com/PProvost/vim-ps1.git',
    'https://github.com/tpope/vim-rails.git',
    'https://github.com/tpope/vim-repeat.git',
    'https://github.com/vim-ruby/vim-ruby.git',
    'https://github.com/ecomba/vim-ruby-refactoring.git',
    'https://github.com/mhinz/vim-signify.git',
    'https://github.com/slim-template/vim-slim.git',
    'https://github.com/garbas/vim-snipmate.git',
    'https://github.com/honza/vim-snippets.git',
    'https://github.com/tpope/vim-speeddating.git',
    'https://github.com/wavded/vim-stylus.git',
    'https://github.com/tpope/vim-surround.git',
    'https://github.com/Twinside/vim-syntax-haskell-cabal.git',
    'https://github.com/nelstrom/vim-textobj-rubyblock.git',
    'https://github.com/kana/vim-textobj-user.git',
    'https://github.com/tpope/vim-unimpaired.git',
    'https://github.com/maxbrunsfeld/vim-yankstack.git',
    'https://github.com/benmills/vimux.git'
  ]


  fabric.api.local('test -e /home/azul/.vim/bundle || mkdir -p /home/azul/.vim/bundle')

  for url in vim_bundle_urls:
      vim_bundle = str(url.split('/')[-1]).split('.git')[0]
      print('checking for vim plugin  %s from %s' % (vim_bundle, url))
      if not fabric.contrib.files.exists('/home/azul/.vim/bundle/%s' % vim_bundle):
          print('cloning %s from %s' % (vim_bundle, url))
          with fabric.context_managers.cd('/home/azul/.vim/bundle/'):
            git_clone(url, vim_bundle)

  fabric.operations.put('files/vim/*', '/home/azul/.vim/')

  fabric.api.local('rm -f /home/azul/.vimrc || echo')
  fabric.api.local('ln -s /home/azul/.vim/vimrc /home/azul/.vimrc')


def _x11_themes():
    themes = [
    'adwaita-common',
    'adwaita-icon-theme',
    'adwaita-qt4',
    'adwaita-qt5',
    'audacious-skins',
    'beastie',
    'claws-mail-themes',
    'clearlooks',
    'clearlooks-metacity',
    'clearlooks-phenix-theme',
    'clearlooks-themes',
    'clearlooks-themes-extras',
    'cursor-chameleon-anthracite',
    'cursor-chameleon-darkskyblue',
    'cursor-chameleon-pearl',
    'cursor-chameleon-skyblue',
    'cursor-chameleon-white',
    'cursor-crystal-theme',
    'cursor-dmz-aa-theme',
    'cursor-dmz-theme',
    'cursor-ecliz',
    'cursor-grounation-theme',
    'cursor-jimmac-theme',
    'cursor-neutral-theme',
    'cursor-neutral-white-theme',
    'cursor-polar-theme',
    'e16-themes',
    'emerald-themes',
    'fluxbox-tenr-styles-pack',
    'fvwm-themes',
    'gnome-backgrounds',
    'gnome-icon-theme-symbolic',
    'gnome-icons',
    'gnome-icons-aqua-fusion',
    'gnome-icons-crystal',
    'gnome-icons-dropline-neu',
    'gnome-icons-dropline-nou',
    'gnome-icons-elementary',
    'gnome-icons-faenza',
    'gnome-icons-gentoo-test',
    'gnome-icons-gion',
    'gnome-icons-iris',
    'gnome-icons-jini',
    'gnome-icons-lila',
    'gnome-icons-noia-full',
    'gnome-icons-noia-warm',
    'gnome-icons-refined',
    'gnome-icons-slick',
    'gnome-icons-snow-apple',
    'gnome-icons-stylish',
    'gnome-icons-ximian-south',
    'gnome-themes',
    'gnome-themes-extras',
    'gnome-themes-standard',
    'greybird-theme',
    'gtk-E17-theme',
    'gtk-aluminumalloy-cryogenic-theme',
    'gtk-aluminumalloy-smog-theme',
    'gtk-aluminumalloy-toxic-theme',
    'gtk-aluminumalloy-volcanic-theme',
    'gtk-aquaextremesunken-theme',
    'gtk-aurora-engine',
    'gtk-blueprint-engine',
    'gtk-cleanice-engine',
    'gtk-digital-cream-theme',
    'gtk-digital-harmony-theme',
    'gtk-engines2',
    'gtk-envy-theme',
    'gtk-equinox-engine',
    'gtk-gray-theme',
    'gtk-lila-theme',
    'gtk-lila-theme-extras',
    'gtk-longhorninspirat-theme',
    'gtk-milk-theme',
    'gtk-murrina-aqua',
    'gtk-murrina-fancy-clearlooks',
    'gtk-murrina-lightblue',
    'gtk-murrine-engine',
    'gtk-murrine-themes',
    'gtk-nodoka-engine',
    'gtk-oxygen-engine',
    'gtk-qnxtheme',
    'gtk-qt4-engine',
    'gtk-xfce-engine',
    'gtk3-oxygen-engine',
    'gtk3-unico-engine',
    'icon-naming-utils',
    'icons-human-azul',
    'icons-tango',
    'icons-tango-extras',
    'irssi-themes',
    'kde-gtk-config',
    'kde-icons-black-and-white',
    'kde-icons-cezanne',
    'kde-icons-dark-glass',
    'kde-icons-gartoon-blue-svg',
    'kde-icons-gartoon-svg',
    'kde-icons-graphite-rade8',
    'kde-icons-icosx',
    'kde-icons-kool-gorilla',
    'kde-icons-lime-rade8',
    'kde-icons-lush',
    'kde-icons-noia',
    'kde-icons-nuovext2',
    'kde-icons-nuvola',
    'kde-icons-sky',
    'kde-icons-umicons',
    'kde4-base-artwork',
    'kde4-icons-oxygen',
    'kde4-style-bespin',
    'kde4-style-nitrogen',
    'kde4-style-oxygen-transparent',
    'kde4-style-polyester',
    'kde4-style-skulpture',
    'kde4-wallpapers',
    'kde4-wallpapers-freebsd',
    'kde4-windeco-crystal',
    'kde4-windeco-dekorator',
    'kdeartwork4',
    'linux-c6-hicolor-icon-theme',
    'linux-f10-hicolor-icon-theme',
    'linux-f10-qtcurve-gtk2',
    'linux-hicolor-icon-theme',
    'lxappearance',
    'lxde-icon-theme',
    'mate-backgrounds',
    'mate-icon-theme',
    'mate-icon-theme-faenza',
    'mate-themes',
    'metacity-aluminumalloy-cryogenic-theme',
    'metacity-aluminumalloy-smog-theme',
    'metacity-aluminumalloy-toxic-theme',
    'metacity-aluminumalloy-volcanic-theme',
    'metacity-aquaextremesunken-theme',
    'metacity-digital-cream-theme',
    'metacity-digital-harmony-theme',
    'metacity-longhorninspirat-theme',
    'metacity-milk-theme',
    'metacity-theme-microgui',
    'metacity-themes',
    'mint-themes',
    'murrine-configurator',
    'nimbus',
    'numix-theme',
    'openbox-themes',
    'plank-theme-moka',
    'qt4-style-float',
    'qt4-style-phase',
    'qt4-style-quantumstyle',
    'qtcurve',
    'qtcurve-gtk2',
    'qtcurve-kde4',
    'qtcurve-qt4',
    'qtcurve-qt5',
    'qtcurve-utils',
    'rezlooks',
    'sawfish-themes',
    'slim-themes',
    'thewidgetfactory',
    'ubuntulooks',
    'xcursor-themes'
    ]

    for item in themes:
        _ensure_package('x11-themes/' + item)


