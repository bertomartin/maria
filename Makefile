.PHONY: clean

LIBS_MIN   = lib/evento/evento-min.js      \
             lib/hijos/hijos-min.js        \
             lib/arbutus/arbutus-min.js    \
             lib/grail/grail-min.js        \
             lib/hormigas/hormigas-min.js

LIBS       = lib/evento/evento.js          \
             lib/hijos/hijos.js            \
             lib/arbutus/arbutus.js        \
             lib/grail/grail.js            \
             lib/hormigas/hormigas.js

SRCS       = src/header.js                 \
             src/namespace.js              \
             src/create.js                 \
             src/borrow.js                 \
             src/subclass.js               \
             src/borrowEvento.js           \
             src/Model.js                  \
             src/SetModel.js               \
             src/View.js                   \
             src/ElementView.js            \
             src/SetView.js                \
             src/Controller.js             \
             src/Model.subclass.js         \
             src/SetModel.subclass.js      \
             src/View.subclass.js          \
             src/ElementView.subclass.js   \
             src/SetView.subclass.js       \
             src/Controller.subclass.js

build: $(LIBS_MIN) $(LIBS) $(SRCS)
	mkdir -p build
	cat $(LIBS) $(SRCS) >build/maria.js
	cat $(SRCS) >build/maria-tmp1.js
	jsmin <build/maria-tmp1.js >build/maria-tmp2.js
	rm build/maria-tmp1.js
	cat $(LIBS_MIN) src/header.js build/maria-tmp2.js >build/maria-min.js
	rm build/maria-tmp2.js

clean:
	rm -rf build
