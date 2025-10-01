# Contributing to ShopFast

Thank you for your interest in contributing to ShopFast! This document provides guidelines and instructions for contributing.

## Getting Started

### Prerequisites

- Node.js 18 or higher
- npm 9 or higher
- Git
- A Supabase account (free tier works)

### Development Setup

1. **Fork and Clone**
   ```bash
   git clone https://github.com/YOUR_USERNAME/shopfast.git
   cd shopfast
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Environment Setup**
   ```bash
   cp .env.example .env
   # Edit .env with your Supabase credentials
   ```

4. **Start Development Server**
   ```bash
   npm run dev
   ```

## Development Workflow

### Branch Naming Convention

- `feature/` - New features (e.g., `feature/add-wishlist`)
- `fix/` - Bug fixes (e.g., `fix/cart-total-calculation`)
- `docs/` - Documentation updates (e.g., `docs/update-readme`)
- `refactor/` - Code refactoring (e.g., `refactor/optimize-queries`)
- `test/` - Test additions/updates (e.g., `test/add-cart-tests`)

### Commit Message Guidelines

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Test additions/updates
- `chore`: Build process or auxiliary tool changes

**Examples:**
```bash
feat(cart): add wishlist functionality
fix(checkout): resolve address validation issue
docs(readme): update installation instructions
perf(products): optimize database queries
```

### Code Quality Standards

1. **TypeScript**
   - Use TypeScript for all new code
   - Define proper types/interfaces
   - Avoid `any` type when possible

2. **Code Style**
   - Run linter before committing: `npm run lint`
   - Use 2 spaces for indentation
   - Follow existing code patterns

3. **Component Guidelines**
   - Keep components small and focused
   - Use functional components with hooks
   - Implement proper prop types
   - Add JSDoc comments for complex logic

4. **Performance**
   - Optimize re-renders with `useMemo` and `useCallback`
   - Implement proper loading states
   - Handle errors gracefully

### Testing

```bash
# Type checking
npm run typecheck

# Linting
npm run lint

# Build test
npm run build
```

## Pull Request Process

1. **Create a Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make Your Changes**
   - Write clean, maintainable code
   - Follow the code quality standards
   - Add comments for complex logic

3. **Test Your Changes**
   ```bash
   npm run lint
   npm run build
   ```

4. **Commit Your Changes**
   ```bash
   git add .
   git commit -m "feat(scope): description"
   ```

5. **Push to Your Fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Open a Pull Request**
   - Use a clear, descriptive title
   - Fill out the PR template completely
   - Reference any related issues
   - Add screenshots for UI changes

### Pull Request Checklist

- [ ] Code follows the project's style guidelines
- [ ] Self-review of code completed
- [ ] Comments added for complex code
- [ ] No new warnings generated
- [ ] Build succeeds (`npm run build`)
- [ ] Lint passes (`npm run lint`)
- [ ] Documentation updated if needed
- [ ] PR description clearly describes changes

## Code Review Process

1. At least one maintainer review required
2. All CI checks must pass
3. No merge conflicts with main branch
4. All review comments addressed

## Project Structure

```
src/
├── components/       # React components
│   ├── AuthModal.tsx
│   ├── CartDrawer.tsx
│   └── ...
├── hooks/           # Custom React hooks
│   ├── useAuth.ts
│   ├── useCart.ts
│   └── ...
├── lib/             # Utilities and configs
│   ├── database.types.ts
│   └── supabase.ts
└── App.tsx          # Main application component
```

## Supabase Database Schema

When making database changes:

1. Update the schema in Supabase dashboard
2. Regenerate types: Update `src/lib/database.types.ts`
3. Test all affected queries
4. Document schema changes in PR description

## Performance Optimization Guidelines

1. **Database Queries**
   - Use indexes for frequently queried columns
   - Implement pagination for large datasets
   - Optimize JOIN operations

2. **Frontend**
   - Lazy load components when appropriate
   - Implement code splitting
   - Optimize images and assets

3. **Caching**
   - Use React Query/SWR for data fetching
   - Implement proper cache invalidation
   - Utilize Supabase session caching

## Security Guidelines

1. **Never commit:**
   - API keys or secrets
   - Environment variables
   - Personal data
   - Credentials

2. **Always:**
   - Use environment variables
   - Implement proper RLS policies
   - Validate user input
   - Sanitize data before display

## Getting Help

- **Issues**: [GitHub Issues](https://github.com/glferreira-devsecops/shopfast/issues)
- **Discussions**: [GitHub Discussions](https://github.com/glferreira-devsecops/shopfast/discussions)
- **Email**: Via GitHub profile

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

## Recognition

Contributors will be recognized in the project README and release notes.

---

Thank you for contributing to ShopFast! 🚀
