### A Pluto.jl notebook ###
# v0.14.0

using Markdown
using InteractiveUtils

# ╔═╡ 57a4a61e-9443-11eb-157b-33b902461930
begin
		using DataFrames
	    using QuadGK
		using Distributions			
end

# ╔═╡ dee12ce0-9447-11eb-2a63-bd79b3022505
begin
	using Plots
	pyplot()
end

# ╔═╡ e178b6f0-9463-11eb-276b-39124721cdf8
begin
	using Statistics
	using Random
end

# ╔═╡ b0e1b862-9441-11eb-054c-753f2ef7c86f
md"# Problem 1"

# ╔═╡ f7955210-9443-11eb-09b1-35082e651464
kldivergence(p,q)= quadgk(x->pdf(p,x)*log(pdf(p,x)/pdf(q,x)),-35,35)

# ╔═╡ 965cdff0-9447-11eb-04fa-dbce6b65e787
md"# Problem 2"

# ╔═╡ 27e46dd0-9448-11eb-0923-07a7f1f108bb
begin
	U = Uniform()
	a = -5:0.004:7
	count = 1/0.004 + 1
	div = []
end

# ╔═╡ c3d7a2d0-9447-11eb-2ab0-3b017aa7c2f3
begin
function kldivergence(arr,mu,sigma)
	Q = [pdf(Normal(mu,sigma), j) for j in a]
	val = 0
	for j in 1:length(a)
		if arr[j] > 0
			val = val + arr[j]*log2(arr[j]/Q[j])
		end
	end
	return val
end

function parameter(s)
	mu1 = sum([a[j]*(s[j]/(count-1)) for j in 1:length(a)])
	sigma1 = sqrt(sum([(a[j]-mu1)^2*(s[j]/(count-1)) for j in 1:length(a)]))
	push!(div, kldivergence(s, mu1, sigma1))
end
end

# ╔═╡ 262874b0-9442-11eb-3e78-13255e97aaab
begin
	res=DataFrame()
	res.v=1:5
	res.divergence=[kldivergence(TDist(j),Normal(0,1))[1] for j in 1:5]
	res
end

# ╔═╡ 5943db90-9461-11eb-0846-69d1add3f5e9
begin
	arr1= [pdf(U, j) for j in a]
	parameter(arr1)
end	

# ╔═╡ 698b2f80-9461-11eb-0710-d1f23644a8c6
begin
function convolution1(X)
		return sum([pdf(U, i)*pdf(U, X-i) for i in a])
	end
ar1 = convolution1.(a)/count
parameter(ar1)
function convolution2(X)
		return sum([ar1[i]*pdf(U, X-a[i]) for i in 1:length(a)])
end
for j in 2:9
	global ar1 = convolution2.(a)/count
	parameter(ar1)
	end
end

# ╔═╡ d0e37c00-9461-11eb-1931-ef633741334f
div

# ╔═╡ d50d2880-9461-11eb-0c76-c92b7498954e
plot(2:10, div[2:10], xlabel="values of n", ylabel="KL divergence")

# ╔═╡ a234f2e0-9447-11eb-127f-01e2f0bcff73
md"# Problem 3"

# ╔═╡ 5d7ae6d0-9467-11eb-32b9-9f2971a91421
point=[]

# ╔═╡ 8b1a39c0-9448-11eb-2eb7-33805eb6cb98
begin
	for _ in 1:275
	    push!(point,0)
	end
	
	for _ in 1:250
	    push!(point,1)
	end
	
	for _ in 1:101
	    push!(point,2)
	end
	for _ in 1:350
	    push!(point,3)
	end
	for _ in 1:100
	    push!(point,4)
	end
	for _ in 1:50
	    push!(point,5)
	end
	for _ in 1:29
	    push!(point,6)
	end
	for _ in 1:29
	    push!(point,7)
	end
	for _ in 1:27
	    push!(point,8)
	end
	for _ in 1:23
	    push!(point,9)
	end
	for _ in 1:22
	    push!(point,10)
	end
	for _ in 1:20
	    push!(point,11)
	end
	for _ in 1:10
		push!(point,12)
	end	
end

# ╔═╡ 492fbde0-9467-11eb-0ff6-15aaffa2b644
mean(point)

# ╔═╡ d4eaa832-9468-11eb-0d79-970a145d81dd
median(point)

# ╔═╡ 5fd6c640-9469-11eb-1250-37d966ce6890
mode(point)

# ╔═╡ de608830-9468-11eb-159b-dba50ebb208f
begin
	histogram(point)
	vline!([mean(point)],label="Mean",color="yellow",line=4)
	vline!([mode(point)],label="Mode",color="green",line=4)
	vline!([median(point)],label="Median",color="red",line=4)
end

# ╔═╡ a68428c0-9447-11eb-025c-1dcc0244d666
md"# Problem 4"

# ╔═╡ 31f70f20-94ad-11eb-384b-1f20a6e3e67f
begin
    randsample=[]
	for i in 1:10000
	    sample=rand(Uniform(0,1),30)
		range=maximum(sample)-minimum(sample)
	    push!(randsample,range)
	end
	function calculate(randsample)
	    bin=100
		array=[]
	    for i in 1:bin
	        temp = 0
	        for j in 1:length(randsample)
	            if randsample[j]>= (i-1)*1/bin 
	                if randsample[j]<=(i)*1/bin
	                    temp=temp+1
	                end
	            end
	        end
	        for k in 1:temp
	            push!(array,i/bin)
	        end
	    end
		return[mean(array),median(array),mode(array)]
	end
end

# ╔═╡ 48458220-94ad-11eb-2c41-bf78afdf5fbf
r=calculate(randsample)

# ╔═╡ 546b3fe0-94ad-11eb-1f07-6f216f0db610
begin
	histogram(randsample,xlabel="Range",ylabel="Count",bin=100)
	vline!([r[1]],label="Mean",color="yellow",line=3)
	vline!([r[2]],label="Median",color="red",line=3)
	vline!([r[3]],label="Mode",color="green",line=3)
end

# ╔═╡ aa1824f0-9447-11eb-010b-a5386ebd20a9
md"# Problem 6"

# ╔═╡ ae963300-9447-11eb-2508-a7ec34ee4e87
md"# Problem 7"

# ╔═╡ f42595f0-9523-11eb-19d8-298f7a32cc20
md"let's assume y= OneSidedTail(x) then,
```math
100-x = 100\left(\int_{-\infty}^y \dfrac{1}{\sqrt{2\pi}} e^{\frac{-x^2}{2}} dx\right)
```

The above equation can also be written as 
```math 
100\left(\int_{-\infty}^y pdf(D_n, x)dx\right)-100+x=0
```
where Dn is normal distribution.

As the above equation cannot be solved analytically, so we will use newton's method to solve it.

In the same way we can write Student's T distribution as,
```math 
100\left(\int_{-\infty}^y pdf(D_t, x)dx\right) -100+x=0 
```
```math
\implies 100cdf(y) = 100-x 
```
```math
\implies y = {cdf}^{-1} \left(\dfrac{100-x}{100} \right)
```
where Dt is Student's T distribution.

For this also, We will  use newton's method to solve it numerically."


# ╔═╡ a70d87b0-9531-11eb-02d8-7559f9b6a301
function OneSidedTail(s,y,rtol,x)
	while true
			disteq = 100*quadgk(s, -Inf, y, rtol=rtol)[1]+x-100
			delta = -disteq /(100*s(y)) 
			y =y + delta
			abs(delta) ≤ abs(y)*rtol && break
	end
	return y
end

# ╔═╡ ad296740-9531-11eb-1d41-ebc7779b206b
begin
	step=(0.05:1:100)
	oneNormal= OneSidedTail.(p -> pdf(Normal(0,1),p) , 1, 10^(-4),step)
plot(step,oneNormal,xlabel="x",ylabel="OneSidedTail(x)",label="For Normal Distribution  ")

end

# ╔═╡ b2eacac0-9531-11eb-2369-d1a9051c04c9
begin
	student= OneSidedTail.(p -> pdf(TDist(10),p) , 1, 10^(-4),step)
plot(step,student,xlabel="x",ylabel="OneSidedTail(x)",label=" For Student's T Distribution")

end

# ╔═╡ b97e2440-9531-11eb-129e-59cd448b8e5d
OneSidedTail.(p -> pdf(Normal(0,1),p) , 1, 10^(-4),95)

# ╔═╡ be06b9a0-9531-11eb-0dd3-a94d366f2968
OneSidedTail.(p -> pdf(TDist(10),p) , 1, 10^(-4),95)

# ╔═╡ cb4c1832-9531-11eb-3319-6f96ababddc2
md"```math
OneSidedTail(x) = {cdf}^{-1} \left(\dfrac{100-x}{100} \right)
```"

# ╔═╡ bf1ce490-9531-11eb-122d-fbfab8eae2e9
(1-cdf(TDist(10),OneSidedTail.(p -> pdf(TDist(10),p) , 1, 10^(-4),95)))*100

# ╔═╡ c4c011b0-9531-11eb-278a-d7f52bbc7e88
begin
	plot(p->p, p->pdf(Normal(0, 1), p), -10, 10, label="Normal distribution")
plot!(p->p, p->pdf(Normal(0, 1), p), -10, OneSidedTail.(p -> pdf(Normal(0,1),p) , 1 , 10^(-4),95), fill=(0, :green,0.4), label="Area of Normal distribution")
plot!(p->p, p->pdf(TDist(10),p),-10, OneSidedTail.(p -> pdf(TDist(10),p) , 1, 10^(-4),95), fill=(0, :blue), label="Area of Student's T distribution")
end

# ╔═╡ d8afad20-9531-11eb-1ed0-6d3c9d1e83a8
begin
	plot(p->p, p->pdf(TDist(10), p), -10, 10, label=" Student's T distribution")
	plot!(p->p, p->pdf(Normal(0, 1), p), -10, OneSidedTail.(p -> pdf(Normal(0,1),p) , 1 , 10^(-4),95), fill=(0, :green,0.4), label="Area of Normal distribution")
	plot!(p->p, p->pdf(TDist(10),p),-10, OneSidedTail.(p -> pdf(TDist(10),p) , 1, 10^(-4),95), fill=(0, :blue), label="Area of Student's T distribution")
	
end

# ╔═╡ Cell order:
# ╟─b0e1b862-9441-11eb-054c-753f2ef7c86f
# ╠═57a4a61e-9443-11eb-157b-33b902461930
# ╠═f7955210-9443-11eb-09b1-35082e651464
# ╠═262874b0-9442-11eb-3e78-13255e97aaab
# ╟─965cdff0-9447-11eb-04fa-dbce6b65e787
# ╠═dee12ce0-9447-11eb-2a63-bd79b3022505
# ╠═27e46dd0-9448-11eb-0923-07a7f1f108bb
# ╠═c3d7a2d0-9447-11eb-2ab0-3b017aa7c2f3
# ╠═5943db90-9461-11eb-0846-69d1add3f5e9
# ╠═698b2f80-9461-11eb-0710-d1f23644a8c6
# ╠═d0e37c00-9461-11eb-1931-ef633741334f
# ╠═d50d2880-9461-11eb-0c76-c92b7498954e
# ╟─a234f2e0-9447-11eb-127f-01e2f0bcff73
# ╠═e178b6f0-9463-11eb-276b-39124721cdf8
# ╠═5d7ae6d0-9467-11eb-32b9-9f2971a91421
# ╠═8b1a39c0-9448-11eb-2eb7-33805eb6cb98
# ╠═492fbde0-9467-11eb-0ff6-15aaffa2b644
# ╠═d4eaa832-9468-11eb-0d79-970a145d81dd
# ╠═5fd6c640-9469-11eb-1250-37d966ce6890
# ╠═de608830-9468-11eb-159b-dba50ebb208f
# ╟─a68428c0-9447-11eb-025c-1dcc0244d666
# ╠═31f70f20-94ad-11eb-384b-1f20a6e3e67f
# ╠═48458220-94ad-11eb-2c41-bf78afdf5fbf
# ╠═546b3fe0-94ad-11eb-1f07-6f216f0db610
# ╟─aa1824f0-9447-11eb-010b-a5386ebd20a9
# ╟─ae963300-9447-11eb-2508-a7ec34ee4e87
# ╟─f42595f0-9523-11eb-19d8-298f7a32cc20
# ╠═a70d87b0-9531-11eb-02d8-7559f9b6a301
# ╠═ad296740-9531-11eb-1d41-ebc7779b206b
# ╠═b2eacac0-9531-11eb-2369-d1a9051c04c9
# ╠═b97e2440-9531-11eb-129e-59cd448b8e5d
# ╠═be06b9a0-9531-11eb-0dd3-a94d366f2968
# ╟─cb4c1832-9531-11eb-3319-6f96ababddc2
# ╠═bf1ce490-9531-11eb-122d-fbfab8eae2e9
# ╠═c4c011b0-9531-11eb-278a-d7f52bbc7e88
# ╠═d8afad20-9531-11eb-1ed0-6d3c9d1e83a8
