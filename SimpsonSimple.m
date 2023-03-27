% Integrates the function f using Simpson's 1/3 rule.
% Infinte loop (not recommended), has to be stopped by user input
% Inputs:
%  - f: The function to integrate
%  - a, b: The limits of integration
% Outputs:
%  - res: The value of the definite integral of f from a to b

function res = SimpsonSimple(f, a, b)

    while true
       % Get user input for a and b
        a = input('a: ');
        b = input('b: ');
        
        % Compute the necessary terms for Simpson's 1/3 rule
        aux1 = (b-a)/6;
        aux2 = f(b) + f(a);
        aux3 = 4*f((b+a)/2); 
        
        % Compute the integral using Simpson's 1/3 rule
        res = aux1*(aux2+aux3);
        
        % Output the result
        disp(['The integral is: ', num2str(res)])
    end 

end  