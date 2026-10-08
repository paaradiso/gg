export function request_animation_frame(callback) {
    requestAnimationFrame(() => {
        callback();
    });
}

export function clear_canvas(canvasId) {
    const canvas = document.getElementById(canvasId);
    if (!canvas) return;

    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    ctx.clearRect(0, 0, canvas.width, canvas.height);
}

export function draw_rect(canvasId, x, y, width, height, colorCss) {
    const canvas = document.getElementById(canvasId);
    if (!canvas) return;

    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    ctx.fillStyle = colorCss;
    ctx.fillRect(x, y, width, height);
}
