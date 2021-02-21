### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ c3fa7be0-6ede-11eb-255f-0dfa0db8c678
begin
	using Plots
	pyplot()
	using Random
end

# ╔═╡ 767cd1a0-7358-11eb-368b-bf90968d08bb
md"# Problem1"

# ╔═╡ c6101570-6ede-11eb-0d76-99debb65e563
begin
	arr=[]
	num=10^5
	count=0
	for i in 1:num
		count+=rand(-10^7:10^7)
		push!(arr,count/i)
	end
	plot(arr,legend=false)
end

# ╔═╡ Cell order:
# ╠═767cd1a0-7358-11eb-368b-bf90968d08bb
# ╠═c3fa7be0-6ede-11eb-255f-0dfa0db8c678
# ╠═c6101570-6ede-11eb-0d76-99debb65e563
