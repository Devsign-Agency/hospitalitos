export type DataTableType<T> = {
    columns: { title: string, field: keyof T, templateId?: string, css?: string, wrapperCss?: string }[],
    actions: { label: string, actionIdToReturn: string, iconUrl: string, showOption: () => boolean }[]
}
