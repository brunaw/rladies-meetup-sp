set.seed(2018)
clientes <- data.frame(id = 1:40,
                       classe = rep(c("A", "B"), each = 20), 
                       sexo = rep(c("F", "M"), 20),
                       quantidade = rpois(n = 40, lambda = 0.5)+1, 
                       valor_gasto = c(round(abs(rnorm(n = 20, mean = 7, sd = 1)), 2),
                                       round(abs(rnorm(n = 20, mean = 3, sd = 1)), 2)))
write.table(clientes, file = "dados.txt")

clientes %>% 
  ggplot(aes(valor_gasto)) +
  geom_density(fill = "skyblue3", alpha = 0.5) + 
  geom_vline(xintercept = mean(clientes$valor_gasto), linetype = 2, size = 1.1) +
  theme_bw() 

clientes %>% 
  group_by(classe, sexo) %>% 
  summarise(media_gasto = sum(quantidade * valor_gasto)/n_distinct(id)) 
