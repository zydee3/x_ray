function [xO] = secantiter(phi, xn1,xn2, Nmax)
    if (Nmax == 0); xO = xn2; return; end
    xO = secantiter(phi, xn2,...
        xn2 - f(xn2).*(xn1-xn2)./(f(xn1)-f(xn2)),...
        Nmax - 1);
end