function sonidoN=normalizar(sonido)
 maximo = max(abs(sonido));
 n= length(sonido);
 for i = 1:1:n
     sonidoN(i) = sonido(i)/maximo;
 end
 end
