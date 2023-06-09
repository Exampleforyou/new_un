library("lmtest")
library("GGally")
library("car")

data = swiss

#�������� ���������� �������� ����������� ����� ������������
model1 = lm(Agriculture~Examination+Catholic, data)
model2 = lm(Examination~Agriculture+Catholic, data)
model3 = lm(Catholic~Agriculture+Examination, data)
summary(model1)
summary(model2)
summary(model3)

#������, ������� ���������� ���������
model4 = lm(Fertility ~ Agriculture+Examination+Catholic, data)
summary(model4)

ggpairs(swiss)

modelee = lm(Fertility~Agriculture+Examination+Catholic, data)
modelee
vif(modelee)

model = lm(Fertility~Agriculture+Education+Catholic+Examination+Infant.Mortality, data)
model
summary(model)
vif(model)

model0 = lm(Fertility~Agriculture+Catholic, data)
model0
summary(model0)

model1 = lm(Fertility~Agriculture+Education+Catholic, data)
model1
summary(model1)

model2 = lm(Fertility~Agriculture+Catholic+Examination, data)
model2
summary(model2)

model3 = lm(Fertility~Agriculture+Catholic+Infant.Mortality, data)
model3
summary(model3)

model4 = lm(Fertility~Agriculture+Examination+Infant.Mortality, data)
model4
summary(model4)

model5 = lm(Fertility~Catholic+Education+Infant.Mortality, data)
model5
summary(model5)

model6 = lm(Fertility~Catholic+Examination+Infant.Mortality, data)
model6
summary(model6)

model7 = lm(Fertility~Education+Examination+Infant.Mortality, data)
model7
summary(model7)

#������������
coef(model7)
#������������� ��������� �������������
confint(model7, level = 0.90)

#������������� �������� ��� ������������ ����� Education

#47 ����������, ����������� 4 ������������: 47 - 4 = 43 ������� �������
#������ ������������� �������� ��� ������������ ����� Education � ������ 7
#������ se = sqrt (������� �������������� ������� �� ������� ��������� ��� ���� � ������� summary ������)
#se = 0.1709
se = 0.1709
#�������� ���������: 95%, 43 ������� �������
t_critical = qt(0.975, df = 43)
model7$coefficients[2] - t_critical * se
model7$coefficients[2] + t_critical * se
#��������
confint(model7, level = 0.95)

#����� ��������� ����� ������� �����������:
model8 = lm(Fertility~Catholic+Examination+Infant.Mortality, data)
model8
summary(model8)

model9 = lm(Fertility~Catholic+Examination+Infant.Mortality + I(Catholic^2), data)
model9
summary(model9)
vif(model9)

#���� ������� - ��������� ��������� �������
waldtest(model8, model9)

#������� � ������������� ����������
new.data = data.frame(Catholic = 20, Examination = 10, Infant.Mortality = 10)
predict(model8, new.data, interval = "confidence")

