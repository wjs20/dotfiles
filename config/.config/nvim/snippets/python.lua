return {
    s("createview", fmt([[
        def {object}_create(request):
            form = {form}(request.POST or None)
            if form.is_valid():
                {object} = form.save()
                return redirect({object})
            context = {{"form": form}}
            return render(request, "{template_name}", context=context)
    ]], {
        object = i(1, "object"),
        form = i(2, "form"),
        template_name = i(3, "template_name"),
    }, {
        repeat_duplicates = true
    })),
    s("detailview", fmt([[
        def {object}_detail(request, pk):
            {object} = get_object_or_404({model}, pk=pk)
            context = {{"{object}": {object}}}
            return render(request, "{template_name}", context)
    ]], {
        object = i(1, "object"),
        model = i(2, "model"),
        template_name = i(3, "template_name"),
    }, {
        repeat_duplicates = true
    })),
    s("listview", fmt([[
        def {object}_list(request):
            {object}s = get_list_or_404({model}.objects.all())
            context = {{"{object}s": {object}s}}
            return TemplateResponse(request, "{template_name}", context)
    ]], {
        object = i(1, "object"),
        model = i(2, "model"),
        template_name = i(3, "template_name"),
    }, {
        repeat_duplicates = true
    })),
    s("updateview", fmt([[
        def {object}_update(request, pk):
            {object} = get_object_or_404({model}, pk=pk)
            form = {form}(request.POST or None, initial={object})
            if form.is_valid():
                {object} = form.save()
                return redirect({object})
            context = {{"form": form}}
            return render(request, "{template_name}", context=context)
    ]], {
        object = i(1, "object"),
        model = i(2, "model"),
        form = i(3, "form"),
        template_name = i(4, "template_name"),
    }, {
        repeat_duplicates = true
    })),
    s("deleteview", fmt([[
        {}
        def {object}_delete(request, pk):
            {object} = get_object_or_404({model}, pk=pk)
            if request.method == "POST":
                {object}.delete()
                return redirect("{app_label}:{object}_list")  # Redirect to a list view after successful deletion

            context = {{"{object}": object}}
            return render(request, "{template_name}", context)
    ]], {
        object = i(1, "object"),
        model = i(2, "model"),
        app_label = i(3, "app_label"),
        template_name = i(4, "template_name"),
        i(0),
    }, {
        repeat_duplicates = true
    }))
}
