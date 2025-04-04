A = input("Please Enter Matrix A: ");
EnequalityType = input("Please Determine The Type Of Your Enequality by entreing 1 for > or 2 for <: ");
t1 = tic;
temp01 = size(A);
b = zeros([temp01(1,1) , 1]);
n = temp01(1,2);
m = temp01(1,1);
indexSet = [1:1:m];
variationMatrix = nchoosek(indexSet,n-1);
temp02 = size(variationMatrix);
variationNumber = temp02(1,1);
EDMatrix = [];
for i = 1:variationNumber
    B = [];
    for j = variationMatrix(i,:)
        B = [B ; A(j,:)];
    end
    temp03 = size(B);
    c = [zeros([temp03(1,1) , 1]) ; 1];
    B = [B ; 1 1 1];
    if det(B)~=0
        x = linsolve(B,c);
        ConditionType = [EnequalityType];
        if A*x >= b
            ConditionType = [ConditionType 1];
        elseif A*x <= b
            ConditionType = [ConditionType 2];
        end
        if isequal(ConditionType,[1,1])
            EDMatrix = [EDMatrix x];
        elseif isequal(ConditionType,[2,2])
            EDMatrix = [EDMatrix x];
        end
    end
end
if isequal(EDMatrix,[])
    disp("There are No Extreme Directions!")
else
    EDMatrix = unique(EDMatrix.', 'rows').';
    temp04 = size(EDMatrix);
    EDNumber = temp04(1,2);
    AnswerBoard = [];
    for i = 1:EDNumber
        AnswerBoard = [AnswerBoard "d"+i];
    end
    disp([AnswerBoard;EDMatrix])
end
t2 = toc(t1);
disp("Computing The Problem with " + n + " Dimension and " + m + " Constraints takes " + t2 + " seconds!")