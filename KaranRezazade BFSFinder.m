A = input("Please Enter Matrix A: ");
b = input("Please Enter Matrix b: ");
t1 = tic;
r = rank(A);
temp01 = size(A);
c = temp01(1,2);
indexSet = [1:1:c];
variationMatrix = nchoosek(indexSet,r);
temp02 = size(variationMatrix);
variationNumber = temp02(1,1);
indexVariation = temp02(1,2);
BFSMatrix = [];
for i = 1:variationNumber
    mainX = zeros(c,1);
    B = [];
    for j = variationMatrix(i,:)
        B = [B A(:,j)];
    end
    if det(B)~=0
        x = linsolve(B,b);
        if x >= 0
            for k = 1:indexVariation
                mainX(variationMatrix(i,k)) = x(k);
            end
            BFSMatrix = [BFSMatrix mainX];
        end
    end
end
if isequal(BFSMatrix,[])
    disp("There are No Basic Feasible Solutions!")
else
    temp03 = size(BFSMatrix);
    BFSNumber = temp03(1,2);
    AnswerBoard = [];
    for i = 1:BFSNumber
        AnswerBoard = [AnswerBoard "x"+i];
    end
    disp([AnswerBoard;BFSMatrix])
end
t2 = toc(t1);
disp("Computing The Problem with " + n + " Dimension and " + m + " Constraints takes " + t2 + " seconds!")