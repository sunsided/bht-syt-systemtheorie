function y = sigma(x)

    count = length(x);
    y = ones(1, count);
    
    %{
    for i=1:count
        if x(i)<0; y(i) = 0; end;
    end
    %}

    y(x < 0) = 0;
end