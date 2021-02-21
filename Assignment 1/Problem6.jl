### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 74bc6aa0-7421-11eb-2058-fd85658b5c1b
begin
	using Plots
		pyplot()
		using Random
	bag = Array[[1 1 1 1 1 1 1 1 1 0], [1 1 1 1 1 1 1 1 0 0], [1 1 1 1 1 1 1 0 0 0], [1 1 1 1 1 1 0 0 0 0], [1 1 1 1 1 0 0 0 0 0 ], [1 1 1 1 0 0 0 0 0 0], [1 1 1 0 0 0 0 0 0 0], [1 1 0 0 0 0 0 0 0 0], [1 0 0 0 0 0 0 0 0 0], [0 0 0 0 0 0 0 0 0 0]]
	p=[0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
	ans=[]
end

# ╔═╡ 931f0ac0-7421-11eb-1e0e-75131eb09066
md"# Problem 6"

# ╔═╡ 9876d700-7421-11eb-3c2a-995212eaae70
begin
	for k in 1:10
		count = 0
		for i in 1:10^6
			rupee = 10
			for j in 1:20
				a = rand(bag[k])
				if a == 1
					rupee += 1
				elseif a == 0
					rupee -= 1
				end
			end
			if rupee >= 10
				count +=1
			end
		end
		push!(ans, count/10^6)
	end
end

# ╔═╡ a021e210-7421-11eb-123e-cb5fe804ce3b
for i in 1:10
		println("p=",p[i],"       ","Respective probability=",ans[i])
end

# ╔═╡ a63731f0-7421-11eb-2b4f-e1c29f985e89
begin
	scatter(p, ans, label = "point")
	plot!(p, ans, xlabel = "values of p", ylabel = "Respective Probability", label = "line")
end

# ╔═╡ Cell order:
# ╠═931f0ac0-7421-11eb-1e0e-75131eb09066
# ╠═74bc6aa0-7421-11eb-2058-fd85658b5c1b
# ╠═9876d700-7421-11eb-3c2a-995212eaae70
# ╠═a021e210-7421-11eb-123e-cb5fe804ce3b
# ╠═a63731f0-7421-11eb-2b4f-e1c29f985e89
