function [ Prawe ] = WektorPrawychPredk( q, t, Wiezy, rows )
%WEKTORPRAWYCHPREDK Funkcja do wyznaczania prawych stron w rownaniu
%liniowym na predkosci qdot - czyli minus (sic!) pochodna wektora wiezow po czasie

    Prawe = zeros(rows, 1);
    m=1;

    for l=1:length(Wiezy)
        if(lower(Wiezy(l).typ(1)) == 'd')
            if(lower(Wiezy(l).klasa(1)) == 'o')
                Prawe(m) = eval(Wiezy(l).dotfodt);
                m=m+1;
            elseif(lower(Wiezy(l).klasa(1)) == 'p')
                Prawe(m) = eval(Wiezy(l).dotfodt);
                m=m+1;
            end
        end
        if(lower(Wiezy(l).typ(1)) == 'k')
            if(lower(Wiezy(l).klasa(1)) == 'o')
                % Prawe(m:(m+1), 1) = zeros(2,1);
                m=m+2;
            elseif(lower(Wiezy(l).klasa(1)) == 'p')
                % Prawe(m:(m+1), 1) = zeros(2,1);
                m=m+2;
            end
        end
    end

end

