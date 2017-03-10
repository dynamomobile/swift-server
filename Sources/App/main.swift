import Vapor

let drop = Droplet()

drop.get("hello") { request in
    return "Hello, world!"
}

drop.get("hello/info") { request in
    return "This is the page where we could show more info"
}

// ROOT
drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "Dynamo-server"]
    ])
}

// ANIMATION
drop.get("animation") { request in
    return try drop.view.make("dynamo.html")
}
drop.get("dynamo_hype_generated_script.js") { request in
    return try drop.view.make("dynamo/dynamo_hype_generated_script.js")
}
drop.get("HYPE-576.thin.min.js") { request in
    return try drop.view.make("dynamo/HYPE-576.thin.min.js")
}
drop.get("dynamo_logo.png") { request in
    return try drop.view.make("dynamo/dynamo_logo.png")
}
drop.get("PIE.htc") { request in
    return try drop.view.make("dynamo/PIE.htc")
}

// DICTIONARY
drop.get("hello/info") { request in
    return "This is the page where we could show more info"
}

drop.resource("posts", PostController())

drop.run()
