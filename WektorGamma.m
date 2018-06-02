function [ Gamma ] = WektorGamma( q, qdot, t, Wiezy, rows )
%WEKTORGAMMA Funkcja obliczajaca wektor Gamma potrzebny w zadaniu o
%przyspieszeniach

%input_wymiary;

Gamma = zeros(rows, 1);

m=1;
    
for l=1:length(Wiezy)
    if(lower(Wiezy(l).typ(1)) == 'd')
        if(lower(Wiezy(l).klasa(1)) == 'o')
            Gamma(m, 1) = eval(Wiezy(l).ddotfodt);
            m = m+1;
        elseif(lower(Wiezy(l).klasa(1)) == 'p')
            Gamma(m,1) = (RotMat(q_phi(q, Wiezy(l).bodyj)) * Wiezy(l).perp)'*...
                ( 2*Omega()*( q_r(qdot, Wiezy(l).bodyj) - q_r(qdot, Wiezy(l).bodyi) )*...
                q_phi(qdot, Wiezy(l).bodyj) + ( q_r(q, Wiezy(l).bodyj) - q_r(q, Wiezy(l).bodyi) ) *...
                q_phi(qdot, Wiezy(l).bodyj)*q_phi(qdot, Wiezy(l).bodyj) - ...
                RotMat(q_phi(q, Wiezy(l).bodyi))*Wiezy(l).sA * (q_phi(qdot, Wiezy(l).bodyj) - q_phi(qdot, Wiezy(l).bodyi)) * ...
                (q_phi(qdot, Wiezy(l).bodyj) - q_phi(qdot, Wiezy(l).bodyi))) + eval(Wiezy(l).ddotfodt);
            m = m+1;
        else
            error(['Blednie podana klasa dla wiezu nr ', num2str(l)]);
        end
    elseif(lower(Wiezy(l).typ(1)) == 'k')
        if(lower(Wiezy(l).klasa(1)) == 'o')
            Gamma(m:(m+1), 1) = RotMat(q_phi(q, Wiezy(l).bodyi)) * Wiezy(l).sA * ...
                q_phi(qdot, Wiezy(l).bodyi) * q_phi(qdot, Wiezy(l).bodyi) - ...
                RotMat(q_phi(q, Wiezy(l).bodyj)) * Wiezy(l).sB * ...
                q_phi(qdot, Wiezy(l).bodyj) * q_phi(qdot, Wiezy(l).bodyj);
            m = m+2;
        elseif(lower(Wiezy(l).klasa(1)) == 'p')
            % Gamma(m, 1) = 0; - pomijamy linijke, bo zero jest domyslnie
            m = m+1;
            
            Gamma(m,1) = (RotMat(q_phi(q, Wiezy(l).bodyj)) * Wiezy(l).perp)'*...
                ( 2*Omega()*( q_r(qdot, Wiezy(l).bodyj) - q_r(qdot, Wiezy(l).bodyi) )*...
                q_phi(qdot, Wiezy(l).bodyj) + ( q_r(q, Wiezy(l).bodyj) - q_r(q, Wiezy(l).bodyi) ) *...
                q_phi(qdot, Wiezy(l).bodyj)*q_phi(qdot, Wiezy(l).bodyj) - ...
                RotMat(q_phi(q, Wiezy(l).bodyi))*Wiezy(l).sA * (q_phi(qdot, Wiezy(l).bodyj) - q_phi(qdot, Wiezy(l).bodyi)) * ...
                (q_phi(qdot, Wiezy(l).bodyj) - q_phi(qdot, Wiezy(l).bodyi)));
            m = m+1;
        else
            error(['Blednie podana klasa dla wiezu nr ', num2str(l)]);
        end
    else
        error(['Blednie podany typ dla wiezu nr ', num2str(l)]);
    end
end

end

